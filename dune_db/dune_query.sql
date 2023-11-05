SELECT blockchain, project, version, block_time, token_pair, token_bought_amount, token_sold_amount, amount_usd, amount_usd * 0.03 AS trading_fees, amount_usd * 0.03 * 0.5 AS fees_to_publisher, tx_hash, tx_from,tx_to, evt_index
FROM uniswap_v3_base.trades
WHERE tx_from = {{lead_wallet_address}}
Limit 1