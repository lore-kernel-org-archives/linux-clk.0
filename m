Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F614CA29C
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 19:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790278552; cv=none; b=FJZ0TM0MvyBESjwS7M+Mekenkdb3/bjXLIk5DhvIo0L65w8iTF+ybH5g4RlTvSBsmX7/vkkth4Gab038mMKL41SXu1FaTxaADje5skL01uhJCiRaK8AQpm01GOWYa4694ETuMxsERLpccpGsYXepRk+g+/91KFalgLnHDSx4YiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790278552; c=relaxed/simple;
	bh=Q9V/OyxnzpEXhb1+HiEXe9l33vd3hEia2l4gk0QcaEc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SrqoxFfPW22KEvWYMhqhyFGLKPJPbMFhZR8Wx0Me8YXzkJokBSWSbpgVuCmhGTOw7WMgxhsMs2kKmv1GnFnCQ7KB9MfJtpZvU3qQ2mJwS4s9yOhgOITTpBM87tRuRLqVYPzDNOoCeNaZJQtiNDkeDmbqXszDnrT4m1XOf0+tBpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GyxDHMEw; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=VyRZePYn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GyxDHMEw";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="VyRZePYn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790278541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=faoj1Myu+9icVQdUpGQqIdpGYG/tK6O2kdZEgu4Y+4w=;
	b=GyxDHMEw9Ice88SdB3avp+QzveJ3pGOAyczCrL8fZYS1/Dq97t5ivMapi+8TW3nZRq6VyW
	5FNLy9PT+NNFpH2cTpWvUYxvaSYgpbBfzMIVjCF6cb7AsQIJxMd5W2fXLSvPAO7jJFj13X
	6/DHU7iyl5eSj33XW/vXNRP2Ik+cPpI=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-88-q-uaAUrvMC-3hSqsduOPeA-1; Thu, 24 Sep 2026 15:35:39 -0400
X-MC-Unique: q-uaAUrvMC-3hSqsduOPeA-1
X-Mimecast-MFC-AGG-ID: q-uaAUrvMC-3hSqsduOPeA_1790278539
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-86c3a053d9bso3479127b3.0
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790278539; x=1790883339; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=faoj1Myu+9icVQdUpGQqIdpGYG/tK6O2kdZEgu4Y+4w=;
        b=VyRZePYn25jjRwexYbALRmCNDrC9GHE35CcaCAgLOlZW+7zLrq5pMTg0fQFqnnwV6o
         S1Ib5l/u42gL3DK5W3YHUOQcElC844LABzbEdVekhyGlLt79G0WluxQH2KKtCQYqbAbU
         4ljI7FOoVkUAD15VgkXbRHTDh4erudX4Xu9uaP7mHJ4EIQW9zjIkmLn/+sY4koA0quPB
         pSeNpXH29yJjioN+Jllzk42XP9/axysho0IbQ0xjk/IFnYekoMuS7hrO/AdjNZg7o1lP
         f+K8qM6wT//g6iK89IR/LRpDLHrK8C9a5nkFu3YB28R7t2dA17516KYFUHJLjdgmhhgP
         XPiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790278539; x=1790883339;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=faoj1Myu+9icVQdUpGQqIdpGYG/tK6O2kdZEgu4Y+4w=;
        b=llvqvqAikQJ7nbYLSa0NS1U4jague2cZj/K+hedZ38Gb8vaw+mufRJYURjGcj2mOTX
         jlH1S5av02U5KbRBYe/WfqJ853d4lvWhJMg8Ze4YcuNWRj8ryKCj8mFsV7ivwJ91/Nbh
         +52NWLIRoCXA8oXYk1UWHTdsuwQuQbLCx7VqHv6jaa8o1NDN7w3c2cp9h7ueFhLFpKud
         V1TusCB0agiNRfz9dIhTKAKSusxz2xWQE5DgLc3m8Y2YQnfHVl8sdSMYsv8eyMXgb1xK
         63ufGW9Stav/9bRDImotEYzGIqOnWVVCBQDReieUgdu0r9LreT7ER8J4f/GL59c1Hp7s
         Bm3Q==
X-Gm-Message-State: AFuF++l4x5h7z131eAzqP7oLkKrwNuo/6JJxKmCrd1TyKFsAgavbKhDo
	Q3dy7TKMBEo2eFch/CXbuzQWqFsjucb+7htrUdA6r85OWZX79y+LHcY/ApkLZsinDE435Pf+jGf
	haqkhZMHS5V0NfOtoaDya0SvP1gk2lpwaZPPSwfmOKD9Sz95Dq8t+YLe+CIUbdg==
X-Gm-Gg: AYBFou2Ichfb/3FDLzI/N+a0P56TAXd8iyoeTwlwnh89R2GwSCOnFTQW6a8zBg4n/wD
	wnnKUXgFajord0hndHwYyyF1w35D9sZfyn5RU+sMAxAhXVUx5pckWFfyT0PvLLBbLGT5ZWXUls2
	KUaANO+VSSmJWb1ETsVMKpi7yKLU06IBoKEcgzgixuzRxQTeX5/EfOzYptj3LABqMRWtltnRrOk
	Q65ncvrvrdiusGRE3jIO79on5rEvZTDCo73/c5tTpBbWW7SuRnbjncCkldiIFJEo4hlhrmd4w+D
	rbgTbC7U1PeyCp3s8DlL8nYZUpK5ewzrL5NL5q7P0dI1Wceg14laNvUV5LivFBMu50r3+IIZTUu
	Rqw5T5vQ=
X-Received: by 2002:a05:690c:e21a:10b0:89b:689d:3a73 with SMTP id 00721157ae682-8a64968736bmr19121917b3.42.1790278539196;
        Thu, 24 Sep 2026 12:35:39 -0700 (PDT)
X-Received: by 2002:a05:690c:e21a:10b0:89b:689d:3a73 with SMTP id 00721157ae682-8a64968736bmr19121737b3.42.1790278538479;
        Thu, 24 Sep 2026 12:35:38 -0700 (PDT)
Received: from [192.168.134.224] ([2600:382:8501:4f43:e566:7498:c7c8:a7ec])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a860fbcb2csm997117b3.25.2026.09.24.12.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 12:35:37 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Gregory Clement <gregory.clement@bootlin.com>, 
 Andrew Lunn <andrew@lunn.ch>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Aamir Ahmed <elb12345@hotmail.co.uk>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>, 
 linux-hardening@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <AS8P251MB000199E5C86A0447B3FC48EDC8B42@AS8P251MB0001.EURP251.PROD.OUTLOOK.COM>
References: <AS8P251MB000199E5C86A0447B3FC48EDC8B42@AS8P251MB0001.EURP251.PROD.OUTLOOK.COM>
Subject: Re: [PATCH] clk: mvebu: ap-cpu-clk: Assign .num before accessing
 .hws
Message-Id: <179027850326.211017.6896107198657392154.b4-ty@b4>
Date: Thu, 24 Sep 2026 15:35:03 -0400
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=317; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=90S9+JQ9kh2224ZVg9ldJrz1f/1vkihNmKSNrXDf66s=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLK2Vrf4iC9aYqXVz71kbdH+Ov1saU+nCVp74zj/zdWyX
 mEz/UV/RykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABO5x8HwP+Xe94k/F3Qz7le/
 aWa/fb275ucvfCwNMmdm2e078PxT8TyG//k/v/++Pquid3fu0QMaWlpS1TdcLl8o4LMx/e64uC9
 zATMA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Sat, 05 Sep 2026 21:48:07 +0100, Aamir Ahmed wrote:
> clk: mvebu: ap-cpu-clk: Assign .num before accessing .hws

Applied, thanks!

[1/1] clk: mvebu: ap-cpu-clk: Assign .num before accessing .hws
      commit: b4243850393f2f24e21b9f4b2c56233e60c904b4

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

