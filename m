Return-Path: <SRS0=99XN=PW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6BB9C43387
	for <linux-clk@archiver.kernel.org>; Mon, 14 Jan 2019 15:46:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9D90E2087E
	for <linux-clk@archiver.kernel.org>; Mon, 14 Jan 2019 15:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1547480760;
	bh=W6YhRBKwKf66F3ICs7bl7TALyIXBWD6CcLebdDxd2/A=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:List-ID:From;
	b=ITmUNr65CGfN5MGdFQmdFhfpS+gqRpgpfhosMyby58//xCLLZ9bV3woOHfqeRKEEy
	 sqDaCTOEpWJ4yzsyVRmIhNqn8yBA+lsPIYUIaEdfaJaNv3HMujNbsnU0r35CZ17CIA
	 7ifH5OS098vquAkv2If/tzKaP2mj4hd6TER/16Sg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726728AbfANPqA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Jan 2019 10:46:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:60264 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726646AbfANPqA (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 14 Jan 2019 10:46:00 -0500
Received: from [192.168.1.23] (cpe-70-114-128-244.austin.res.rr.com [70.114.128.244])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BD4CD2063F;
        Mon, 14 Jan 2019 15:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1547480759;
        bh=W6YhRBKwKf66F3ICs7bl7TALyIXBWD6CcLebdDxd2/A=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=hPDvSemU6JkiHL9M2VsxC8fCiUGFH3qe/TOLdiRLs8EN3aq+0MvaGWzoh9w/4SZm9
         eRxXhCNuGSA8p404dZ/5FqBCggjmNvoGPtkyo0kKlZIt5iZqbiGORHU+wktdnedj8S
         ZYltX6Q3XKEHJC+lv0pVVVV+53EssAJquqjiaNoo=
Subject: Re: [PATCH RESEND 1/2] clk: socfpga: stratix10: fix naming convention
 for the fixed-clocks
To:     linux-clk@vger.kernel.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org,
        linux-stable@vger.kernel.org
References: <20190102145932.26423-1-dinguyen@kernel.org>
From:   Dinh Nguyen <dinguyen@kernel.org>
Openpgp: preference=signencrypt
Autocrypt: addr=dinguyen@kernel.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <178e0501-5e75-20b0-4650-08b1d0e80f3e@kernel.org>
Date:   Mon, 14 Jan 2019 09:45:57 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190102145932.26423-1-dinguyen@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

You've already applied 2/2 of this patch series[1] to clk-fixes, but can
you also apply this patch as well?

Thanks,
Dinh

[1] https://www.spinics.net/lists/linux-clk/msg33940.html

On 1/2/19 8:59 AM, Dinh Nguyen wrote:
> The fixed clocks in the DTS file have a hyphen, but the clock driver has
> the fixed clocks using underbar. Thus the clock driver cannot detect the
> other fixed clocks correctly. Change the fixed clock names to a hyphen.
> 
> Fixes: 07afb8db7340 ("clk: socfpga: stratix10: add clock driver for
> Stratix10 platform")
> Cc: linux-stable@vger.kernel.org
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---
>  drivers/clk/socfpga/clk-s10.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/clk/socfpga/clk-s10.c b/drivers/clk/socfpga/clk-s10.c
> index 5b238fc314ac..8281dfbf38c2 100644
> --- a/drivers/clk/socfpga/clk-s10.c
> +++ b/drivers/clk/socfpga/clk-s10.c
> @@ -12,17 +12,17 @@
>  
>  #include "stratix10-clk.h"
>  
> -static const char * const pll_mux[] = { "osc1", "cb_intosc_hs_div2_clk",
> -					"f2s_free_clk",};
> +static const char * const pll_mux[] = { "osc1", "cb-intosc-hs-div2-clk",
> +					"f2s-free-clk",};
>  static const char * const cntr_mux[] = { "main_pll", "periph_pll",
> -					 "osc1", "cb_intosc_hs_div2_clk",
> -					 "f2s_free_clk"};
> -static const char * const boot_mux[] = { "osc1", "cb_intosc_hs_div2_clk",};
> +					 "osc1", "cb-intosc-hs-div2-clk",
> +					 "f2s-free-clk"};
> +static const char * const boot_mux[] = { "osc1", "cb-intosc-hs-div2-clk",};
>  
>  static const char * const noc_free_mux[] = {"main_noc_base_clk",
>  					    "peri_noc_base_clk",
> -					    "osc1", "cb_intosc_hs_div2_clk",
> -					    "f2s_free_clk"};
> +					    "osc1", "cb-intosc-hs-div2-clk",
> +					    "f2s-free-clk"};
>  
>  static const char * const emaca_free_mux[] = {"peri_emaca_clk", "boot_clk"};
>  static const char * const emacb_free_mux[] = {"peri_emacb_clk", "boot_clk"};
> @@ -33,14 +33,14 @@ static const char * const s2f_usr1_free_mux[] = {"peri_s2f_usr1_clk", "boot_clk"
>  static const char * const psi_ref_free_mux[] = {"peri_psi_ref_clk", "boot_clk"};
>  static const char * const mpu_mux[] = { "mpu_free_clk", "boot_clk",};
>  
> -static const char * const s2f_usr0_mux[] = {"f2s_free_clk", "boot_clk"};
> +static const char * const s2f_usr0_mux[] = {"f2s-free-clk", "boot_clk"};
>  static const char * const emac_mux[] = {"emaca_free_clk", "emacb_free_clk"};
>  static const char * const noc_mux[] = {"noc_free_clk", "boot_clk"};
>  
>  static const char * const mpu_free_mux[] = {"main_mpu_base_clk",
>  					    "peri_mpu_base_clk",
> -					    "osc1", "cb_intosc_hs_div2_clk",
> -					    "f2s_free_clk"};
> +					    "osc1", "cb-intosc-hs-div2-clk",
> +					    "f2s-free-clk"};
>  
>  /* clocks in AO (always on) controller */
>  static const struct stratix10_pll_clock s10_pll_clks[] = {
> 
