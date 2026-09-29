Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650043AEF3F
	for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 17:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790701877; cv=none; b=FGQPPUT2Jg3ir/YcNu2hvKPqn+tTJ3AKdbsEfYhwp/8PeVj9kWqH8xkOEzmM5eAzwkEJQq962wvfJ2K1g0XIh01KeH5NBZMWrJiiM3zfarsnhNXnoOjcVHnTtRJSqbgvtYmHPCbibWsW8PBldVOSQlj3Q/s1DXYqqVvqCW9jgxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790701877; c=relaxed/simple;
	bh=u4SRmlcilS5Q15H4klz5bfEhtq5Qf7+ZsgM6eMFI8rk=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=CHNThnBEbYHVpHORFxTRfhpNxlRPv++4VYlBy3kBHGHTkKf/biLW0F0TzsZLJoF4wyk+qJc4oOaaSGEY02U75+QVxDKpnTBQxcW1/nfGJOw43UTrRJP+pAMaoIY6uyJgnyhbWyScVbfA1M1HiwNUlgTr/sEV4T/eyzJsj+vnjLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fJNpW/f9; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=mQjybdEc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fJNpW/f9";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="mQjybdEc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790701875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=InpVDEJ0Zf6t0g63w3tMQgbC1FuEaClDXGKLkVndD9s=;
	b=fJNpW/f9v1g16C+ji02oRvT7UZx/8BjfCnJXXwMAQyegbh/TwgjkIPCYZf27hkU4oPkVCB
	uwVI2mKxT1GJLdaYNusBVT3Cd10fSZW8thrYW7dwBXFR+mXzoxmlTI9kFOK+/5I4l+8Pnr
	eTDhXburIpWz/f0+mBRRFzHLdUWSp58=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-151-Gp1t9St9MuuqHePQuEYHBg-1; Tue, 29 Sep 2026 13:11:13 -0400
X-MC-Unique: Gp1t9St9MuuqHePQuEYHBg-1
X-Mimecast-MFC-AGG-ID: Gp1t9St9MuuqHePQuEYHBg_1790701873
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93c614646e9so506118885a.0
        for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 10:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790701873; x=1791306673; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=InpVDEJ0Zf6t0g63w3tMQgbC1FuEaClDXGKLkVndD9s=;
        b=mQjybdEce9OTLNxdU5604vXTRItaUWlOeWhx5y6oStUheeMPWlTvED1JVDjMehw4no
         vOYVBxqlM0bkRCJ5IFHGiMfsJDDsguW0IMZtRxHo0juPmAfdR7iRfxqOC2eniv+Gv0C3
         I3qSN5Fc5VbUmBYE0oOxlsdQvDk/WJ7LypqsyXKbGFY0tG6PFSdUFb5Dim3e/CyC4Qrm
         FN53f3rhbNujgNoWTDCMShCTTyai+jyY74DdfOkdmj5v2OMEOOakjfrStsbXkAwnEJag
         U/6+rxSLP+BNRKywuhacQUinWS0M64h20PioSe6ub8L+XJbkxMt6fUza8KoPqki7Qbvp
         Ygmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790701873; x=1791306673;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=InpVDEJ0Zf6t0g63w3tMQgbC1FuEaClDXGKLkVndD9s=;
        b=gzyM205R6mjTBQeG3k0wwN3+Pk+6PrNihhGW/3C6F4TnuhTLCN/D+p+wpjrQs1OsbL
         Kivpr1xgWEW8iY9c3etBU/Q7i58ZhP+1E/mwJF2yIm2o2HbVeH/dxH5N7Mop2TkFjeq7
         NHRzzjgu2H7eFGjbJk9CbRKVTflJarNZhzrMxYE0wdxvqj0BDZFXaWtZnjVb39uX5xSy
         9kMgkZQmTsbq/NJMRiMyx7VAJSVwMhnksg3B6ap71vpTniczU4w2SOikYgrefeV6TcM2
         FLRfxpXqCG5z8e1PIa6ZpXxo45KP1N0LYlsFNlkdLgl+2SPpBQwz9UMB/sg8YlxSF0lW
         tMWg==
X-Forwarded-Encrypted: i=1; AKwUvBxFsso9NQPcHHT88RA39EUejxJiY5pcuph2VW7XGoHjD6almt5uXd4b3iHjeHdlgN5E4h60uKHwRTU=@vger.kernel.org
X-Gm-Message-State: AFuF++mtVMB3lsbk7NMG0SP23INOM0rIl1uwLd66gADMtDDLYsAI1ZVL
	aXDy7dUhAAafRGjjjw6ABbnk6/h6CDmM6WwiTBA1aTGypp7Tx5HizqHZjnzVkSzF1w7YVj/ZFK8
	JseEvr/cksqW2rU/HepYlzhubfWquiN/4JBYTgeI4IZOoea8Iup9BLDXih2FENg==
X-Gm-Gg: AYBFou2Qb75W/t7C9s+hher3ga5eu4N2Q5RcP2UeC22Ao+HCi+OsJUp18K34KeGKurA
	j+yDHsFLZsDF4dU2FGtZ9ERS7yYE20/77PN6fOxwio9ZDDomiRXfb/p+2gJomWWGM0s0MFIZNM/
	oMmd4xhJegDsL4QJ4laYHo7+Q7l3B61C7z45ZpbM0/HTJlr4eqa3TK1YIDPGjehdtzC8A6Pr5Yq
	IdcN+o3l36zngdW97YEbx0JvZX19s2mY0NdV+6Cn5KkhS7YukWKJWFMgTkU7Om9pHIvsc4HRXcD
	aORGBlXgLlLkTPpRuwmTSIaKoeo2vhtDDCPTu6LOYBv/lYbxof0pa24moWTyjmM/kcysgM0grB+
	qESDFSIrgql3n7uWTKSMZOJfUdXfYA+kiJIQTl8jDetlrumKqU8A=
X-Received: by 2002:a05:620a:6193:b0:93b:e82b:a584 with SMTP id af79cd13be357-93c9f8a415cmr39166485a.35.1790701872698;
        Tue, 29 Sep 2026 10:11:12 -0700 (PDT)
X-Received: by 2002:a05:620a:6193:b0:93b:e82b:a584 with SMTP id af79cd13be357-93c9f8a415cmr39159185a.35.1790701872042;
        Tue, 29 Sep 2026 10:11:12 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c9f561a6bsm15271185a.41.2026.09.29.10.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 10:11:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] clk: starfive: jh7110-isp: fix pm_runtime error
 handling
From: Brian Masney <bmasney@redhat.com>
To: phucduc.bui@gmail.com
Cc: Emil Renner Berthing <kernel@esmil.dk>, 
 Hal Feng <hal.feng@starfivetech.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Palmer Dabbelt <palmer@rivosinc.com>, 
 Xingyu Wu <xingyu.wu@starfivetech.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260918050051.14986-1-phucduc.bui@gmail.com>
References: <20260918050051.14986-1-phucduc.bui@gmail.com>
Date: Tue, 29 Sep 2026 13:11:06 -0400
Message-Id: <179070186697.213266.8534133348671524620.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=826; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=u4SRmlcilS5Q15H4klz5bfEhtq5Qf7+ZsgM6eMFI8rk=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJ2f9T9ybLnwdndSb1pu1gZI59kzbe8Er1/ait38eFbS
 Tl+abZfOkpZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZjIdGOG/+U7rZwSzyme5/9a
 /oB7/ynHr3qJL458jWntOvne5tl5QW2G/7XRFz7sZyqcUNAWan6ya37HyRe73tVPEhWckdkbuE5
 PnAEA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Hi bui,

On 2026-09-18 12:00 +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> pm_runtime_get_sync() leaves the runtime PM usage counter incremented even
> when it fails, but the error path in jh7110_ispcrg_probe() does not call
> pm_runtime_put_noidle() to balance it, leaking a reference each time
> resume fails.
> 
> Use pm_runtime_resume_and_get() instead, which automatically drops the
> usage counter on failure, fixing the leak.
> 
> Also disable runtime PM before returning from the error path to balance
> the pm_runtime_enable() call.
> 
> Fixes: 81279f5d0812 ("clk: starfive: Add StarFive JH7110 Image-Signal-Process clock driver")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

There's a separate fix for this that I applied earlier today.

Brian

