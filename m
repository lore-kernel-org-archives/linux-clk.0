Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0166128D8DA;
	Fri, 10 Apr 2026 07:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775807765; cv=none; b=BFZHaigK0T8Xnds2YEAWxnpwuOsW6gGvAmvxRXqUTzNobvYafjr0qvRmThsN7EFOqJpQ1Csr7dr/k+bS2/z87Y5RiRpEgsOwE/0eUTO7NM7cEQjKRB2Hh3tAfo6WNtwLn4qY6rj4udk+sU4xTs+LTOxb7XM2SxWUZshZS/bVumI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775807765; c=relaxed/simple;
	bh=ZmO8NKn75iaIxGBSirNTeC+xk+OMBuTTMTQ9NVejXd8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RamCjvf9kAgcatKN88FprAoLkPGcyN0Sg1EezW61p4/uYVVjEQftN/gv63Sgct8a4iS7wwIO3Z5EsGsLtg1s3MT0ydp03QfXiZZY81meRaOmiagwdDj2WMO6nzIT1glv/dELjF8x+R2V7VQZYpbwDU85d0xV57ABdHyPMZrdNvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=kmMrAIRU; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="kmMrAIRU"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 63A7rJ7Y12629035, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1775807599; bh=1gYxyowuHupE/P8ao3pa6ZgxztqPahT8BS261CIm2ZA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=kmMrAIRU6RE8rn9yNwdzSWQeK9lNqkY+Q0SKbuId3utRpkOIscr+P4gnkV67zmbto
	 KSnI1nto9nNw1lToxXPdvvStyI9Rv4w6Wdug9CXcypbowX1V/w7Cul/sIiQWruNtXO
	 DMz69JEuDjNCtZCBw3TGIiPLtdO8h1IlCXKZaRg3VDQczfkBmNnNs75IaWpO8BfxgA
	 q5faJR5Y1I5KBOza8xxPB4QVi6+AzG1qrZrL/Hwa1oyJyrK0D71SfpndnbG1yT7+vD
	 PNCPY/5ztoe3U0NKL3n5DF5+DtAH5YXld8WSd8iQLOtZwseEMjarFoPM+Xe/BOnkix
	 L3NXunJTheZOw==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.26/5.94) with ESMTPS id 63A7rJ7Y12629035
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Apr 2026 15:53:19 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 10 Apr 2026 15:53:18 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 10 Apr 2026 15:53:18 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 10 Apr 2026 15:53:18 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <bmasney@redhat.com>
CC: <afaerber@suse.com>, <conor+dt@kernel.org>, <cy.huang@realtek.com>,
        <cylee12@realtek.com>, <devicetree@vger.kernel.org>,
        <eleanor.lin@realtek.com>, <james.tai@realtek.com>,
        <jyanchou@realtek.com>, <krzk+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-realtek-soc@lists.infradead.org>, <mturquette@baylibre.com>,
        <p.zabel@pengutronix.de>, <robh@kernel.org>, <sboyd@kernel.org>,
        <stanley_chang@realtek.com>
Subject: Re: [PATCH v6 04/10] clk: realtek: Add support for phase locked loops (PLLs)
Date: Fri, 10 Apr 2026 15:53:18 +0800
Message-ID: <20260410075318.2854478-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <ac_SX1UJRqiBH2iM@redhat.com>
References: <ac_SX1UJRqiBH2iM@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Hi Brian,

> Hi Cheng-Yu and Yu-Chun,
>
> On Thu, Apr 02, 2026 at 03:39:51PM +0800, Yu-Chun Lin wrote:
> > From: Cheng-Yu Lee <cylee12@realtek.com>
> >
> > Provide a full set of PLL operations for programmable PLLs and a read-only
> > variant for fixed or hardware-managed PLLs.
> >
> > Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> > Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> > Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> > ---
> > +static int clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> > +			    unsigned long parent_rate)
> > +{
> > +	struct clk_pll *clkp = to_clk_pll(hw);
> > +	const struct freq_table *fv;
> > +	int ret;
> > +
> > +	fv = ftbl_find_by_rate(clkp->freq_tbl, rate);
> > +	if (!fv || fv->rate != rate)
> > +		return -EINVAL;
> > +
> > +	if (clkp->seq_pre_set_freq) {
> > +		ret = regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_pre_set_freq,
> > +					     clkp->num_seq_pre_set_freq);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	ret = regmap_update_bits(clkp->clkr.regmap, clkp->freq_reg,
> > +				 clkp->freq_mask, fv->val);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (clkp->seq_post_set_freq) {
> > +		ret = regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_post_set_freq,
> > +					     clkp->num_seq_post_set_freq);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	if (is_power_on(clkp)) {
> > +		ret = wait_freq_ready(clkp);
>
> I should have checked Sashiko before I hit send on my last review.
> https://sashiko.dev/#/patchset/20260402073957.2742459-1-eleanor.lin%40realtek.com
>
> It suggested the following:
>
>    In the Common Clock Framework, .set_rate executes under the prepare_lock
>    mutex, while .enable and .disable execute under the enable_lock spinlock.
>
>    Could an interleaved clk_pll_enable() corrupt the hardware state by running
>    its seq_power_on sequence concurrently with these multi-step register
>    updates?
>
>    There also appears to be a potential race condition later in this function:
>
>        if (is_power_on(clkp)) {
>            ret = wait_freq_ready(clkp);
>            ...
>        }
>    
>    If .disable() powers off the PLL right before wait_freq_ready() is called,
>    will wait_freq_ready() poll a disabled PLL and erroneously return
>    -ETIMEDOUT? Is a private spinlock needed to serialize these operations?
>
> Brian
>

Agreed, I will add a private spinlock here.

Best Regards,
Yu-Chun
