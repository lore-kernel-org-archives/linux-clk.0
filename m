Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2916C433EF
	for <linux-clk@archiver.kernel.org>; Fri, 29 Oct 2021 04:45:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7FA7761051
	for <linux-clk@archiver.kernel.org>; Fri, 29 Oct 2021 04:45:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231695AbhJ2Erk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 29 Oct 2021 00:47:40 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:35267 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231649AbhJ2Erk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 29 Oct 2021 00:47:40 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id 674C75C0148;
        Fri, 29 Oct 2021 00:45:12 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
  by compute2.internal (MEProxy); Fri, 29 Oct 2021 00:45:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm1; bh=vyy231FXuKUqgqLMipsH9fLVHErGre0
        LfOy72BrnbEQ=; b=dvUuDJ2CvRs13MLkeEmKdxA8TKvyCW26Ho3ONXVwBfP5Sov
        UWsftteHbY6yZcTS8IDvxVKK3OOM+E66KEIxA1VzWcuE2cQlGPKu7jfHBb3Jg2pv
        0uWxMsMZ3GIEz8fQAATVjmGHKoXsxcqYZYuNTOiL5RK0A8S9mefoUz7vXxl73LBt
        nt8lbuWNOkTEaT1yPlxOvqsIZdBy6ovpUfGiKPXDxACYaLD3lkq6vpSC8QM+7XIo
        wcmltqbKa9gHCz6m+pZfxgD2K1bgkPNJlaAdQ3Vy52sAECLnWA7dpG1vpAPqnRMW
        xHQZ+G5oXKPABt2ne9xdqor4+jvudNXUN5nusVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=vyy231
        FXuKUqgqLMipsH9fLVHErGre0LfOy72BrnbEQ=; b=CHgcXEIeSsNkqm7hyqSJWY
        4lrO9aCJD4YLLF5URdM8IIT++KOc8aDplRTD2CgorKwco1LTgKcehU5Rl1yLsRrD
        PLSBt6f9bUtIRfwTTErToDzjTFIPC5FuwpZZ6sZ65F6bqD/1XCO2PosBdAsWkYoL
        upU/eDaOPlIV9/7plim5FL+Ubk9HeGcb0PT4OSIiZZUIfPpec8+T9NqZJZLsn7QU
        5mXpesi8r6WLc9ucmrGF2NUqYbYiGVPqBj4sJ+lgzC4+RhXyvfMe5H+Y6FkVEF19
        cQMOZQYUL7jwfB1Jrdwn8/LNuXWso60Zge/P/D+Ma8rYNLMfDlSNMVAwpRXFL7QQ
        ==
X-ME-Sender: <xms:V3x7YdA_EzzFHN85dcQ0qV3uDkSj-QVKa3H81b7cBxrITQ1nmNoJpQ>
    <xme:V3x7YbgnPVt2nXxGinC5jeWVAjEmhoK9-nbq-ahO4HyR7GSrSazCb1u_iRYp0wQ4z
    5NFIFhHIt3b406NTw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdeggedgkeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
    hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:V3x7YYmRue994ko3-9ln70ORUGgTZQCEbf7gPWiV2DOsl6KZJRd4pw>
    <xmx:V3x7YXx58wcHpmCvX4uU1t_vz4sFmJ_gsQl7ZA4xqhQgLmGM_U9rLg>
    <xmx:V3x7YSTmY-SguYk46tWZrIR32LElTRVNa-T4zIAPSlD7Zr5CbgIZaQ>
    <xmx:WHx7YYOavk5otQwtQUYnFLTv_53u_QqLNAkuChApYELzo3JMPFmj7g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 74332AC0DD1; Fri, 29 Oct 2021 00:45:11 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1369-gd055fb5e7c-fm-20211018.002-gd055fb5e
Mime-Version: 1.0
Message-Id: <8588b86d-7f46-4ce4-bd6e-432499bbc0eb@www.fastmail.com>
In-Reply-To: <20210922235449.213631-1-joel@jms.id.au>
References: <20210922235449.213631-1-joel@jms.id.au>
Date:   Fri, 29 Oct 2021 15:14:51 +1030
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Joel Stanley" <joel@jms.id.au>,
        "Chin-Ting Kuo" <chin-ting_kuo@aspeedtech.com>,
        "Michael Turquette" <mturquette@baylibre.com>,
        "Stephen Boyd" <sboyd@kernel.org>
Cc:     BMC-SW@aspeedtech.com, linux-clk@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH] clk/ast2600: Fix soc revision for AHB
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On Thu, 23 Sep 2021, at 09:24, Joel Stanley wrote:
> Move the soc revision parsing to the initial probe, saving the driver
> from parsing the register multiple times.
>
> Use this variable to select the correct divisor table for the AHB clock.
> Before this fix the A2 would have used the A0 table.
>
> Fixes: 2d491066ccd4 ("clk: ast2600: Fix AHB clock divider for A1")
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  drivers/clk/clk-ast2600.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/clk/clk-ast2600.c b/drivers/clk/clk-ast2600.c
> index bc3be5f3eae1..24dab2312bc6 100644
> --- a/drivers/clk/clk-ast2600.c
> +++ b/drivers/clk/clk-ast2600.c
> @@ -51,6 +51,8 @@ static DEFINE_SPINLOCK(aspeed_g6_clk_lock);
>  static struct clk_hw_onecell_data *aspeed_g6_clk_data;
> 
>  static void __iomem *scu_g6_base;
> +/* AST2600 revision: A0, A1, A2, etc */
> +static u8 soc_rev;
> 
>  /*
>   * Clocks marked with CLK_IS_CRITICAL:
> @@ -191,9 +193,8 @@ static struct clk_hw *ast2600_calc_pll(const char 
> *name, u32 val)
>  static struct clk_hw *ast2600_calc_apll(const char *name, u32 val)
>  {
>  	unsigned int mult, div;
> -	u32 chip_id = readl(scu_g6_base + ASPEED_G6_SILICON_REV);
> 
> -	if (((chip_id & CHIP_REVISION_ID) >> 16) >= 2) {
> +	if (soc_rev >= 2) {
>  		if (val & BIT(24)) {
>  			/* Pass through mode */
>  			mult = div = 1;
> @@ -707,7 +708,7 @@ static const u32 ast2600_a1_axi_ahb200_tbl[] = {
>  static void __init aspeed_g6_cc(struct regmap *map)
>  {
>  	struct clk_hw *hw;
> -	u32 val, div, divbits, chip_id, axi_div, ahb_div;
> +	u32 val, div, divbits, axi_div, ahb_div;
> 
>  	clk_hw_register_fixed_rate(NULL, "clkin", NULL, 0, 25000000);
> 
> @@ -738,8 +739,7 @@ static void __init aspeed_g6_cc(struct regmap *map)
>  		axi_div = 2;
> 
>  	divbits = (val >> 11) & 0x3;
> -	regmap_read(map, ASPEED_G6_SILICON_REV, &chip_id);
> -	if (chip_id & BIT(16)) {
> +	if (soc_rev >= 1) {

This is hidden in the noise a bit, but the patch also isn't that big.

>  		if (!divbits) {
>  			ahb_div = ast2600_a1_axi_ahb200_tbl[(val >> 8) & 0x3];
>  			if (val & BIT(16))
> @@ -784,6 +784,8 @@ static void __init aspeed_g6_cc_init(struct device_node *np)
>  	if (!scu_g6_base)
>  		return;
> 
> +	soc_rev = (readl(scu_g6_base + ASPEED_G6_SILICON_REV) & 
> CHIP_REVISION_ID) >> 16;
> +
>  	aspeed_g6_clk_data = kzalloc(struct_size(aspeed_g6_clk_data, hws,
>  				      ASPEED_G6_NUM_CLKS), GFP_KERNEL);
>  	if (!aspeed_g6_clk_data)
> -- 
> 2.33.0
