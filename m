Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268534AF9E5
	for <linux-clk@vger.kernel.org>; Wed,  2 Sep 2026 22:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788388840; cv=none; b=HMuXtzsbRoodTr/aYpWPi7i45WgFGPh4NuqrHUvk0w0DjBFDVyovdeS70egvzp5k//Vj9bVKKZ9R5gUfBdcGhP2EUoTbcTxLEQgjjoCbf6y+bgR2xXmO3lM3Uh4GqYnCg19IKRHnlkdm1FJydXaDXNpoj1VBhkSwrPdlcD9NoMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788388840; c=relaxed/simple;
	bh=nB9MtG/jZH/uKfPVqmTLfUSN14X89SFk7Mqq+TvM9Gs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bHYCLImMrn74COrvOMFs9vMoqtpnr22jqE2ia93z/1Z5r7iqkrn5aUkv30ZwxBS3BElb7FHK3axRavZFtmrZhZNoAJUWHdjnpwzAgRt56Jva9VkUW4GvPmi/2MJM1vB/E/uDp01wrMtKcPkNbBg2ZQJUbkWNgMhEq1nEekTO6hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DNH28the; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=P07nUBfs; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DNH28the";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="P07nUBfs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788388831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wNcn++DDYySJZokz8/3409CMhSq8WdyhJVAopZOy+GM=;
	b=DNH28theP9j3szOJzPS22D58KI2bN0uGnCgFg4IF7ZSI31MdXGAdx4dfaEnJSx3TQdB3iJ
	lsQ0Tn8tS3WBXtfYffuyfdCcW0PQuwh8CvjE5b3PWrBrJg6ysoSGWGcm8ifV32vPwQLRuC
	fw6B2zmetL3s+VmATzpYE0yegXH8KQk=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-t1a93XsUN0ynjZVM5rIhlw-1; Wed, 02 Sep 2026 18:40:30 -0400
X-MC-Unique: t1a93XsUN0ynjZVM5rIhlw-1
X-Mimecast-MFC-AGG-ID: t1a93XsUN0ynjZVM5rIhlw_1788388830
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93494527488so331905885a.3
        for <linux-clk@vger.kernel.org>; Wed, 02 Sep 2026 15:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788388830; x=1788993630; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wNcn++DDYySJZokz8/3409CMhSq8WdyhJVAopZOy+GM=;
        b=P07nUBfsrtIYhhD0j1WxCxTzWF8oxA9ofXn2Icf/vXqosQA7TDy7hxp5SF8Jx3nbke
         XM5WSnzAh33X7/9dEISJhWMmwGNzH3LiHv78xWCNzLnnPNYpq+18LYKTZjO7HEuZroAC
         NDqdSFm0uGqTCkd4F2RUhOtbEstAC+zGsx22SbMzivgSDw8NEYInjNJx+FKQE/jY3kHV
         yw7+tY6HbzpQC9DUQMrjr10BOkuHkF9P8ATPSuNrcwsKF+lusqqCzOmLpF+7AvMCyIbB
         xiiCyP+4VMB7fhBQYi/UJEs46Zo/mWFC7cUHd45eF64BKiUXmXBp72Fcesu+eTIjxLpP
         Lb1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788388830; x=1788993630;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wNcn++DDYySJZokz8/3409CMhSq8WdyhJVAopZOy+GM=;
        b=TP80bizrObd5puCTeoJaaOlTfRIo64R/gvS1++bPlNAI0JtBGwvaCGoNyJCgmYCD5d
         LAX7AlzM2HxhWCKolY1pWfwM1e9zmhF2McxU1NZjuGTFjoXvYeQeixvYrhUlPUOh0DaM
         /bTFgMtgXT/lxjR4K/wvzbAVPPOkO2780cZ4TCP82rTQ6HaEYTo/SxO5wSxGLSl+lXTO
         WnZz6HhdvW6Z/z2kKd5ZRMWRvcvlxZaqQ7fgnAn158O1y0cges7aGA4GM66JHYGx8E9J
         668NzFFjjCs3Gb4haODKbi3BNXORm3jNLza25cwafWdepLDAVDYS6N3aN+YizrjU80H1
         9p5A==
X-Forwarded-Encrypted: i=1; AKwUvByfphsl7Gen9ZJREHGSd2zmYu5bV2DWfLdIEDYoatLaN/tPoVfB4IZ5RtsEYgeF8MVhdkm6aImX+Ao=@vger.kernel.org
X-Gm-Message-State: AFuF++mWmSkT/mfpNEeezMUkC34bAftH9pRAyn7x2WAq/0YO3v2xHLdX
	FKxUGhdRNpWle57KcrKW0gMNfgPandc1McFFNWWlZT1AfuIBqIt0IYPxBgZ4p0olMTRrapsaKJz
	cJ9v2iz7Eov8o0AalFvWf7zFtDE7Lis7Og6dTKLDZAgWAJs4bhwl6NGGLmKlsTA==
X-Gm-Gg: AYBFou3wqXV8oP/HjyM2gLGSHosqr59j2K3ZN0SsjCBT5W5uSiiZU8DEF9DY+DYG2Ge
	L6R57eK3kbCf5dOu37w0Bvm3uadAU5bp5LVvL5pfl5Cdndy7X3WTRMK2lJWr9LGxur/0yV4iF8k
	vLrEJF7jJWtvl+qU0xMM1eXfkVCEZxFFhYkDf+ufmjEz1rS8jFoRmEg1H6jHbIqIuNfv1KYR1eu
	wzlfLPxis7J57t1GcK7TvjOw1UE4WLDatWF14Ubd//MYByqP8vJbLfNPK9QfgbrtIp4pcBV3sPC
	rt4w8EnwRDXx+N/hMConYLaRfvPHyKtSlT1Fg/UQq8mxrgy4cN1fJpv5UqbgyFVuugGXoZh6ac/
	yaw==
X-Received: by 2002:a05:620a:5ee1:b0:939:6de9:4cff with SMTP id af79cd13be357-9396de96ebbmr234855385a.45.1788388830005;
        Wed, 02 Sep 2026 15:40:30 -0700 (PDT)
X-Received: by 2002:a05:620a:5ee1:b0:939:6de9:4cff with SMTP id af79cd13be357-9396de96ebbmr234852385a.45.1788388829633;
        Wed, 02 Sep 2026 15:40:29 -0700 (PDT)
Received: from [10.239.101.46] ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9395f157ec6sm325731685a.7.2026.09.02.15.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 15:40:29 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: mturquette@baylibre.com, Triet Hoang <triet.hoang.dev@gmail.com>
Cc: sboyd@kernel.org, luca.ceresoli@bootlin.com, krzk@kernel.org, 
 s.nawrocki@samsung.com, cw00.choi@samsung.com, peter.griffin@linaro.org, 
 alim.akhtar@samsung.com, michal.simek@amd.com, shubhrajyoti.datta@amd.com, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260820065904.2032536-1-triet.hoang.dev@gmail.com>
References: <20260820065904.2032536-1-triet.hoang.dev@gmail.com>
Subject: Re: [PATCH] drivers/clk: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Message-Id: <178838882032.2062832.5940694093369397743.b4-ty@b4>
Date: Wed, 02 Sep 2026 18:40:20 -0400
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=303; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=zL0boMPnZXSvjvuLkbS1bHkmEeflCn7eOnBIJo/+CW4=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJmLL0VV+h7R0zPm9dX9HPSGX61EsfIdw9vtRTN/i5/t
 j/WaLZpRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABMJW8fIsH36qdUPmP4Wzj0q
 rGyUEmQd/uuT83qbiGs/py98ZH52/wlGhteCFQ9jr3uHZX69fKc99RrbBgm9fRUeH5YsUXdtrLG
 6xA4A
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Thu, 20 Aug 2026 13:59:04 +0700, Triet Hoang wrote:
> drivers/clk: Convert to DEFINE_SIMPLE_DEV_PM_OPS()

Applied, thanks!

[1/1] drivers/clk: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
      commit: 48bec6fd8ec32ffdf65a5ccf268428a9f79ea210

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

