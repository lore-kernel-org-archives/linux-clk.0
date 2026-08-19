Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1023E3909AB
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 21:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787175785; cv=none; b=VV4ShQCJPlsHellkIQObb457g+Gd3nVOyV02pVhhc4TJrWNM4twRTi6rZ4PL+4DNMNVkjldXI+rhWWt4/oaik4ZUqwqYhqGZuwjEU29ADzs+MAiwEFptbFHo1282/AT3ktef3QUZwF/olaczX7EisSG5J8DghFMkh5paUTMWAeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787175785; c=relaxed/simple;
	bh=ysCBTWJYZED8cm6heg8Hz5joL7PzcnTWeRUGEubki+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LtLKQvyxZGW2TGnvKILyiV9uwxoBn1Z4l1cpl6Wf8X9mgz/PfXhlrTBvA9WVJ3v8jsnrQJ5s5TMafYAUWM/fmmtR7Jqj58B2068WSHDuX5rDZkkYe8HvXGvanRw5NjVRkAFixJ0xxTgVw5RuygoeWykNrutvQDB3NQoIAAX1sMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WFly7UT3; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=DS65/Igt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WFly7UT3";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="DS65/Igt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787175782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YQ9UK0HQnXCrAGrJ3T1tTyPOhL6zeCrydiH56Wdp198=;
	b=WFly7UT3zcSNU1c8ItB6N3UyI6bgOx/EDBchDxiCUImWWic0iWRtXg6zTcUB099h5ohfmH
	Ja3oqEI/T9XYp6cEyStZ5ADzGpMvTUTgmdSWmsEEd+cLtWWPvaYj/TgLoHBjPryNjco8O6
	49fOzpm5n2WCU9NcVnz+uFm0zGccc7Y=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-350-8BOdZX5LNZC-R_7wbfLESg-1; Wed, 19 Aug 2026 17:43:01 -0400
X-MC-Unique: 8BOdZX5LNZC-R_7wbfLESg-1
X-Mimecast-MFC-AGG-ID: 8BOdZX5LNZC-R_7wbfLESg_1787175781
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92ec3146553so291563385a.1
        for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 14:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787175781; x=1787780581; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YQ9UK0HQnXCrAGrJ3T1tTyPOhL6zeCrydiH56Wdp198=;
        b=DS65/IgtL+saAqsK6Khcn0osEqLTzKgsCmnGez0QlYwXbO+wqZuzX7OUDRQ0uEvPD4
         JpotN9KzoBxaTa+r3lV3QsesHReHOboM1Mku7F/7IpZ0Dl3Db3lYyz+Kw3AFreh47bly
         OAEAHztMlPz/3BJZI7Vc6tUQADMe30/DwV4qavFQmP8Okbft/13k8+MmZRpxX8l+v4Z4
         I8GaL3/xhGyKC9sP95LOyaNnDjKPUHiftZ6Gjm2z0K4EwVwU+mbTcn8xCm4eTkZ7jJ6e
         MJe3iO3vT8BRAzSOrgjlSI+pFk+2UZFAdG9dY3I8RjG/kCnVQ6ZcgotSVKE6uZuhdV0u
         1XtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787175781; x=1787780581;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YQ9UK0HQnXCrAGrJ3T1tTyPOhL6zeCrydiH56Wdp198=;
        b=KGJJv21Vh0Wxai2Yx3gJ8r3Yah3CuXciXePcdCLyySsFClGHFblzIInjjlm5iPPTXT
         /FEblAZfiD5j4v7cfPA6NgNfQwVS3YMK1YycNyZ+7iM93Px6Zv7TN0qMwt+CpBZ3DPV1
         Mk5w0EUJITHp6YLsMW0l0L17pOn3w2oyXSON8kXuXzaGtoJVwJ5uanv8XBdqH+2047qH
         ap64o0kd7+LqXPhV7CKoK4Xp6wcJ1QTnd0XNOitrmByrL5JqHcTxhcZJC4AULv/GhiZ8
         J6FcBIqUIoEiTMAiDEqMgfQ+gcqe7IHvx1BiIuvW/2NgmBHdylXkupLf7R50oCwmL71u
         th7Q==
X-Gm-Message-State: AOJu0YzAEq1km/PAeTiFqNaG/gTf6VxcHgXnXKlbMEggDyqdGu8XU3wJ
	tdyBkB/tws9XSHAF6KJQFmnLDYCVk8MtSB0n26mkaB2Saz3RymlYDd6tvNMBtn+Mq0CEj7nPGMv
	0N1ypEI7WNTejDYtFRAbSFnnu3p5VuAM4NqdAf4O4RHNUN/p05/RFpcuPAbqzUA==
X-Gm-Gg: AR+sD11kdRq1uJJtwso7v88lcPVzu8vvfEDOzLCAMIxcMZO7SOK7LaAUBWOAaDOp4YF
	7hUrg4AtLw1DDHJpUCkddA/TuOTqBZExTMQj2YFreS2gy5ZVVvgAjMC2CNQs0lQZjexpPvFfSFT
	E4HZmUYgmRljhk8mjthqf+jcK9luMsCm8WccYqXohw1pKZWR6eduDeOzmdkl7TkZ4Fonc9INa2x
	NnNKMJGWQUD8ST+hH3GwD23UsKEVxKn8x3YAuR9ZL3ClT+6KopXeRbPXFXjeWQSL9sU85qhxnTi
	sWJqiiY505dgIbd14h97h1+wYVyy3O37L188KCuS+Do/D0Lcj23TkqydX5cJahkXmNHFMkYI1g5
	Wcf9fBDg5SyJipDNi+57zWFSG2FZpA+TrXnA=
X-Received: by 2002:a05:620a:2688:b0:92e:4470:f6a7 with SMTP id af79cd13be357-9371e1f7187mr727422385a.10.1787175780984;
        Wed, 19 Aug 2026 14:43:00 -0700 (PDT)
X-Received: by 2002:a05:620a:2688:b0:92e:4470:f6a7 with SMTP id af79cd13be357-9371e1f7187mr727417785a.10.1787175780441;
        Wed, 19 Aug 2026 14:43:00 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9372056b803sm225396385a.23.2026.08.19.14.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 14:42:59 -0700 (PDT)
Date: Wed, 19 Aug 2026 17:42:57 -0400
From: Brian Masney <bmasney@redhat.com>
To: Ruoyu Wang <ruoyuw560@gmail.com>
Cc: linux-clk@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: mediatek: mt7629: Properly use CLK_IS_CRITICAL flag
Message-ID: <aoYjYYpQ50JAgokb@redhat.com>
References: <20260813153113.3952621-1-ruoyuw560@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813153113.3952621-1-ruoyuw560@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Ruoyu,

Just one more comment on top of the Sashiko review.

On Thu, Aug 13, 2026 at 11:31:13PM +0800, Ruoyu Wang wrote:
> The MT7629 clock driver calls clk_prepare_enable() for six clocks that
> must remain running. These calls create permanent references owned by
> the driver. In topckgen and apmixedsys, provider registration can fail
> after the references are acquired, leaving them unreleased.
> 
> Mark ARMPLL, main_core_en, the AXI, memory and DDRPHY selectors, and the
> UART0 gate with CLK_IS_CRITICAL, and remove the manual enable calls. The
> common clock framework then keeps these clocks enabled without
> driver-owned references. This preserves their always-on behavior and
> avoids leaking references when provider registration fails.
> 
> This issue was found by a static analysis checker and confirmed by manual
> source review.
> 
> Fixes: 3b5e748615e7 ("clk: mediatek: add clock support for MT7629 SoC")
> Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
> ---
>  drivers/clk/mediatek/clk-mt7629.c | 36 ++++++++++++++-----------------
>  1 file changed, 16 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mt7629.c b/drivers/clk/mediatek/clk-mt7629.c
> index e154771b1b8bba..627e8017fa642f 100644
> --- a/drivers/clk/mediatek/clk-mt7629.c
> +++ b/drivers/clk/mediatek/clk-mt7629.c
> @@ -48,8 +48,9 @@
>  		_pd_reg, _pd_shift, _tuner_reg, _pcw_reg, _pcw_shift,	\
>  		NULL, "clk20m")
>  
> -#define GATE_APMIXED(_id, _name, _parent, _shift)			\
> -	GATE_MTK(_id, _name, _parent, &apmixed_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
> +#define GATE_APMIXED_AO(_id, _name, _parent, _shift)			\
> +	GATE_MTK_FLAGS(_id, _name, _parent, &apmixed_cg_regs, _shift,	\
> +		 &mtk_clk_gate_ops_no_setclr_inv, CLK_IS_CRITICAL)

[snip]

>  static const struct mtk_gate apmixed_clks[] = {
> -	GATE_APMIXED(CLK_APMIXED_MAIN_CORE_EN, "main_core_en", "mainpll", 5),
> +	GATE_APMIXED_AO(CLK_APMIXED_MAIN_CORE_EN, "main_core_en", "mainpll", 5),

We shouldn't put CLK_IS_CRITICAL in these generic macros for defining
clocks. Your commit message defines specific clocks where this needs to
happen. Put a flags argument in the macro, and pass the critical flag
in. 

There should also be a comment with the code describing why the critical
flag is needed.

Brian

