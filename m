Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA2137C92A
	for <linux-clk@vger.kernel.org>; Wed,  4 Mar 2026 22:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772662892; cv=none; b=o6C2G7D6s3ABC6fkVX4ksaqOKk493BXTeTLn0pGRtAag14/8Pn0Ig3kqmqP/YG4bR+Q7arbX46cTEu1Pcm856tG9Ai+UxtT5clR3FwhP0FPmpiTAmkbibgsceKcRuy2EYx1rgXd63d0Rdt1gxYUbFXhhpd1/mM8aeIx82h08izA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772662892; c=relaxed/simple;
	bh=ZnLFRJR9SgstqYT5jTSnkzolgMIZQT16P4bRyPRE5n4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k3NAD8EwJNuBvHMw0nRNb+PlbpSbyXR1RHpQyXYPnOvyu8QQqSUSRWmr1a0aEGu7ckJwCf+Q9coQFBZ9eD6ln9evhlpxEe9CTKRnrt0r+uxeYMpxZ41sKIeSnTHYiiSL73ZuOuaaNAMURlBfY9TH4CFFwpkYBG9E8P90VV8q4sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IDx90jzC; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Mtt9Oa9W; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IDx90jzC";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Mtt9Oa9W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772662890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5IdMjdarsoIwJ3LjCSMsVj14yfAGd7U/YMfplj+8xe4=;
	b=IDx90jzCuGvYCwrB8R5xPoYorKHrKcue5ZRfkKAQ/qELjj+q3iLNYpg9AF2kO9dG6GGQba
	6saQIs32h4kdEGQqw8aA6zszWJIZ7cm2pEmNzsV2uLz8PDtAv+LYMhqEhBmhFQOiTOl/b4
	pu+L+Op+xiJJvFV17Q4HRmJkwkViniM=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-295-YjNZ61LeOkOhj9OA_Bb_HA-1; Wed, 04 Mar 2026 17:21:29 -0500
X-MC-Unique: YjNZ61LeOkOhj9OA_Bb_HA-1
X-Mimecast-MFC-AGG-ID: YjNZ61LeOkOhj9OA_Bb_HA_1772662888
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70ef98116so5213879985a.1
        for <linux-clk@vger.kernel.org>; Wed, 04 Mar 2026 14:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772662888; x=1773267688; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5IdMjdarsoIwJ3LjCSMsVj14yfAGd7U/YMfplj+8xe4=;
        b=Mtt9Oa9WFD9SJyxZHJt5YU28HPP68SCbO9xTv93FX7Srswa1xmIQjLk3+DnG9sw3mI
         +PhNSjsy3a33Tf9YmFz4quCTUJWLHEI/4+4KCngKKMIUoe+TOZyCpU2ewuF+T2WH0Ak6
         OEsyLtiUgFgFEgKFR1S/nnIIujJE81MLcPfIoOFDr5tUg7DLANMF1JAKs+mIV1NH7dKI
         KfGzWcrtGkifosT7Vb4wZh6fSLdLOu6xDmegUzwbQq+blcYq5U/M/B7un3dCu9IJ96wz
         yRquo2iqMJCvgL6QkFg0j5sOkrQX5t4dQTUn9oayWe9c5150YQ5owE078LF1UA4T0Avj
         bWQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772662888; x=1773267688;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5IdMjdarsoIwJ3LjCSMsVj14yfAGd7U/YMfplj+8xe4=;
        b=jbSTMra8I+uKxz6mM5vAc/cn1+p7lQSCwADB2FlRPequZMAlEOymwt3ZeiDFgFPTmF
         rma9qCw7f7iEkMrEZRpnvdircQhe9IkRFGOlZGHuJk36XuxKKwQ8fWAss3UH6cq+I1pC
         lXGRNAHwdTaxSQwxg33SoOXo1bq5hMRYLA8SxI07U6jdw1zhPweTqurdtJR0xg2xdlPi
         2DjtIDAp++eh57ts+SaTDqv+/xuIKKBQk5++ChJcMMQVTI3TUFbP9Y85IoNz8X3zTWgO
         H7ycCMMrBbeoq0NX3Fzy1ySbh9HYHxIj4hnVRKaPKs0x9GbXCptk6733jWd/bZ5oBKvw
         WUdg==
X-Forwarded-Encrypted: i=1; AJvYcCVxSB20HFD1zYG+P7WKZXdWSgZrabOTxBQ877oe9ietBkIoVT9cjvQdp5frGiGthFd6LhApDNPA48E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+6ipTq+OUj7OU6QFQSOjqzUHWCE2lGip7yv9v0kputqWn3T+i
	9P6Ua9Vza2GQRgkcrhEc6epwy9NW0xhLYnK7xy0U4V6Chmt2/ytYGeqQwUdIZCtXOnACKF9vp17
	l4maXe4efvbuYa3BrfJ7m0iuQtHSzr4xbpP2fHl/1dsNKXHufBmgo8O8tR7sSdA==
X-Gm-Gg: ATEYQzzgHBY1FiOfcBtfSTwMbq7PTT+RxAWV2sCKcEKGrMUE2aakVVXZZzf5vx/bklT
	pNanGHc1nMjaXoeoVGtbD1cmRBNvXABIMTBZ0eIYL1Cu426QtZgc54KYheMMYFDJLMPVn1WkTNL
	Dowsj6BBWCcj34bM8BrNme3UPDbHgREBqKav4E+fCrn8r5FBtOmQvUq98c3Ok+Iy8u+7miJOzeg
	0/xmyRigy25vy8o6AkLpGHWWE459jwWkhyZ24TSDKoL/E/zrpLC5vBKTl3muh83Jmo3FmJqaFpP
	uYWfsDz562AFtBSskHKc1GdlZIokl9q39euKXdDk+Sy+tWPnRie8VmvJ5I0roUgy7AH5inoteqn
	ujWyGS+6vXQjWbKAQLFt8
X-Received: by 2002:a05:620a:472a:b0:8cb:4d46:7a4b with SMTP id af79cd13be357-8cd5afcce10mr459515785a.81.1772662888553;
        Wed, 04 Mar 2026 14:21:28 -0800 (PST)
X-Received: by 2002:a05:620a:472a:b0:8cb:4d46:7a4b with SMTP id af79cd13be357-8cd5afcce10mr459511385a.81.1772662887989;
        Wed, 04 Mar 2026 14:21:27 -0800 (PST)
Received: from redhat.com ([2600:382:7705:162f:3db4:e16a:e5d8:352e])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf66b9d9sm1740582885a.12.2026.03.04.14.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 14:21:27 -0800 (PST)
Date: Wed, 4 Mar 2026 17:21:23 -0500
From: Brian Masney <bmasney@redhat.com>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	joel@jms.id.au, fustini@kernel.org, mpe@kernel.org,
	mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com,
	agross@kernel.org, agross@oss.tenstorrent.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v7 3/3] clk: tenstorrent: Add Atlantis clock controller
 driver
Message-ID: <aaiwYxQuoptMDbBk@redhat.com>
References: <20260303-atlantis-clocks-v7-0-415c9dda086a@oss.tenstorrent.com>
 <20260303-atlantis-clocks-v7-3-415c9dda086a@oss.tenstorrent.com>
 <aadhd3LwZQPkT3A4@redhat.com>
 <CAEev2e_hxUBQjVdxisqBXHQRzspQq6dHT0kCZHUW-6dEyV4faQ@mail.gmail.com>
 <CAEev2e9fEsFqN5b4sAT9cbjVAvJEPvqxoqy74e5mG8K10xBQdg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEev2e9fEsFqN5b4sAT9cbjVAvJEPvqxoqy74e5mG8K10xBQdg@mail.gmail.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Anirudh,

On Wed, Mar 04, 2026 at 11:53:38AM -0600, Anirudh Srinivasan wrote:
> Sorry for the follow up, but wanted to run something by you.
> 
> On Wed, Mar 4, 2026 at 10:40 AM Anirudh Srinivasan <
> asrinivasan@oss.tenstorrent.com> wrote:
> >
> > Hello Brian,
> >
> > On Tue, Mar 3, 2026 at 4:32 PM Brian Masney <bmasney@redhat.com> wrote:
> > >
> > > Hi Anirudh,
> > >
> > > Thanks for the patch. A few minor comments below with some minor
> > > nitpicks, additional places to use FIELD_GET(), plus some suggestions
> > > for additional regmap helpers to use.
> > >
> 
> 
> > > > +
> > > > +static int atlantis_clk_pll_is_enabled(struct clk_hw *hw)
> > > > +{
> > > > +     struct atlantis_clk_pll *pll = hw_to_atlantis_pll(hw);
> > > > +     u32 val, en_val, cg_val;
> > > > +
> > > > +     regmap_read(pll->common.regmap, pll->config.reg_offset, &val);
> > > > +     regmap_read(pll->common.regmap, pll->config.en_reg_offset,
> &en_val);
> > > > +     regmap_read(pll->common.regmap, pll->config.cg_reg_offset,
> &cg_val);
> > > > +
> > > > +     /* Check if PLL is powered on, locked, not bypassed and Gate
> clk is enabled */
> > > > +     return !!(en_val & PLL_CFG_EN_BIT) && !!(val &
> PLL_CFG_LOCK_BIT) &&
> > > > +            (!pll->config.cg_reg_enable || (cg_val &
> pll->config.cg_reg_enable)) &&
> > > > +            !(val & PLL_CFG_BYPASS_BIT);
> > >
> > > Could regmap_test_bits() make this a bit cleaner?
> > >
> > > > +}
> > > > +
> > > > +static int atlantis_clk_pll_enable(struct clk_hw *hw)
> > > > +{
> > > > +     struct atlantis_clk_pll *pll = hw_to_atlantis_pll(hw);
> > > > +     u32 val, en_val, cg_val;
> > > > +     int ret;
> > > > +
> > > > +     regmap_read(pll->common.regmap, pll->config.reg_offset, &val);
> > > > +     regmap_read(pll->common.regmap, pll->config.en_reg_offset,
> &en_val);
> > > > +     regmap_read(pll->common.regmap, pll->config.cg_reg_offset,
> &cg_val);
> > > > +
> > > > +     /* Check if PLL is already enabled, locked, not bypassed and
> Gate clk is enabled */
> > > > +     if ((en_val & PLL_CFG_EN_BIT) && (val & PLL_CFG_LOCK_BIT) &&
> > > > +         (!pll->config.cg_reg_enable || (cg_val &
> pll->config.cg_reg_enable)) &&
> > > > +         !(val & PLL_CFG_BYPASS_BIT)) {
> > >
> > > Same about regmap_test_bits() here.
> >
> > These instances have it reading 3 different registers (unlike almost
> > all the other examples that just read one) and testing bits across
> > them. But I guess it should be possible to use test_bits here too. I
> > will update them.
> 
> This ends up becoming like this.
> 
> static int atlantis_clk_pll_is_enabled(struct clk_hw *hw)
> 
> {
> 
>         struct atlantis_clk_pll *pll = hw_to_atlantis_pll(hw);
> 
> 
> 
> 
>         /* Check if PLL is powered on, locked, not bypassed and Gate clk is
> enabled */
>         return regmap_test_bits(pll->common.regmap, pll->config.reg_offset,
> PLL_CFG_LOCK_BIT) &&
> 
>                 regmap_test_bits(pll->common.regmap,
> pll->config.en_reg_offset, PLL_CFG_EN_BIT) &&
> 
>                 regmap_test_bits(pll->common.regmap,
> pll->config.cg_reg_offset, pll->config.cg_reg_enable) &&
> 
>                 !regmap_test_bits(pll->common.regmap,
> pll->config.reg_offset, PLL_CFG_BYPASS_BIT);
> 
> }
> 
> We can't use a single call of regmap_test_bits to the
> pll->config.reg_offset register cause we need to check if PLL_CFG_LOCK_BIT
> is set and PLL_CFG_BYPASS_BIT is unset. We end up needing to make 2 reads
> to that register.
> 
> Any thoughts on whether I should still be using regmap_test_bits here?

If it's not looking good in practice once you implement it, then just
fall back to the older behavior. It was just a suggestion.

I haven't used this yet, however there are also the regmap_field_xxx()
helpers that are also available. drivers/clk/mstar/clk-msc313-mpll.c
uses these helpers. I don't know if it would help to simplify your code.

Brian

