Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793463880;
	b=VuKkusKTUl/+wCOr3o8fftpmpQn7tvA76+9+werS+hMHPjEta4SpaXmY9ri+1t7Nv8Aq
	 3Ju4Bsev+AqbEhNS+76/ZvhIOHpCSXRydmNBOKAp9O2bin9FkZ6j5tuFsbzUTg4jB0wfB
	 ncCzgUnPbqi54jfFXckPlaPCBpMon6mZ3r5G0HjJ2ETdcQBbtYwMAYru4boUHsrMqf1Di
	 R75K2UmVwdzbM5pRoStlrrTaHwYDYd/3OmHrjWvulhyvfwORGfsp74QrKo220Lzk7Qh1P
	 YLTJ82gNva+O9awsRmPtSFIW0alnl2w2K31OGk5k0hE6b/HTGWyNNzVcyGXZN1a9sNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793463880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=RUAmFD9Oafnzl8e9wUgKXyASSE6sDb5DqBio2IgezSc=;
	b=SnT4Ox1B1ZG+OoCZEsAH974RCPklGZN+9noRgmVKyUIg8JuHnDf81uVEFX7CYnzcLOMK
	 HgU/bhN5g6/Wsq1Ehf02Pmj930pSB8Qg9s7ntyg57OuZ/6pinD/DL1KyBLbSokC0cXE9M
	 XPLlc8bFts86uEqHE0MuzWTBZCBhVhoTARw5VurEa0bxpLieWkTLEXDn7/NMcAt9sBN/y
	 VbG4GyNfTG3bA7ZagkUEHuAhblCbE5gM5iUJktkUQCmOU1ou+y9PHNBEBVKmvCIdHnR8M
	 ZG48C/KLr5dK3y1pdy2xpOCEx18SiWvNyl8uD54qVnnJ9R3axYxqfYRrgse+MGZDT6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="yq/pWgdi";
	arc=none smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998DB606A320
	for <linux-clk@vger.kernel.org>; Sat, 31 Oct 2026 16:24:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 998DB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yq/pWgdi
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5361e313e63so19025671cf.3
        for <linux-clk@vger.kernel.org>; Sat, 31 Oct 2026 09:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793463879; x=1794068679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RUAmFD9Oafnzl8e9wUgKXyASSE6sDb5DqBio2IgezSc=;
        b=yq/pWgdiyCpd1vdvfsuGa/2o7ID9ecW4qEKgJeLhtCzJ8u6W7o/2nn5EQRsUMfyasd
         KjIPYEP0mDurwMzq8s72gSr1/YDrZ99jDbc3EcJCeNh8yADXnWZsPGuI/croyX/Z5RgP
         GkD/GLq4Bp/cljhrcS18pT6IhYrIkwc+5+2uU2KkhOrXdbtkEvynKLV2OVVUmFR3Jivd
         me5F+C4IEgS5BDzoPITHTR0Sjbutsa8TmkfYSWcg+zYBUbHFifAAi+UUNViALQWSfj0g
         nhbfQ7kFBpQZEGgLgK2Rt0oCynFfPFVWO3J8+ksCduLC4MhpUaTJRLlv+Caa9G2T4YMW
         DyGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793463879; x=1794068679;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RUAmFD9Oafnzl8e9wUgKXyASSE6sDb5DqBio2IgezSc=;
        b=F1gT30z78/+x1ElNtXs8vwW4EMD/MWCcH9kghbtsp9OENKA+ivp8M6eanYx5b5txo7
         dccNX5Du/iV/qlkC0GmIdgoA3jAkysKtJ0Mzgrg6rUYloPKiqYmeS/emJdOqsdCeQG6H
         e7JV7j6EZLAVCWd+BX5Pe1/VL0YHHBcFiYHU5p3Hwwn05/5puOFUapRAHd+qhRNru95P
         FWeS1Rr088Q208hRfKhDzJjd3zFZONXmfVG5EJWfBIRPmqUK6TYgdbecbu2an424ZuUF
         8eJFJd8hYQyN1F2uMKeTWmzA5elaT0+610DdvfEBiAEzWFBvYm4asu7GjUsaTwCHKLv0
         BL9w==
X-Forwarded-Encrypted: i=1; AKwUvByd693nvafvfev0Ogq3XjtNyIVE4yC51e6j/cSqpJY9piBPqoqfcl4F1tN1HbnD3PkJGQ3Gov2yP0w=@vger.kernel.org
X-Gm-Message-State: AFq9FYLF/AfzHTyvwmdHJoEGkRi7v5EA2nZoGjawYzPyYM35JXkEAWkX
	U99feZvBH3RtBxy34sDXnuhudJERXxLkIXV6giP4RS3u0n/vzGUd3GQ+
X-Gm-Gg: AYBFou2sV2krxVIf/+YZsRV3uVX1ua95q+/v4RswxWwCpbqL02fB4+cueis7SL+Il/t
	G6F+g4lMd7Byd7ffvJgahJ+b786aN+7iGhgBxRcV+gaDJo+AfNzQSMZXni2+NOPG0ETbtc0yGXH
	4TxkDeWU/su/rZKIoihTyZrv8Oif6L1A2J+vph4UDt79Y2lS+vbt7J2FVa1qd77tqnL/3U+5dEb
	re60xBwpWdbcjYd6EaorpuYoux84FfYu9tQO0JpJI8KtpHdHxKTI9zRna+kdnNhDOhAe7nCfSkR
	t2QsfRxgYPxmOt5FVG8bh0EqHRMyGZ4HPElAkqpssY20dIJmPxwjpJ6PI40/SXB55L6dCI9jAQv
	SAy21zrNGUmcrF+FBYmK1GnbrmFZ+Xkj7pT7I+tX8SGpGHC0KtXeEkLy7o+AIcxnoIg4v9HbHu/
	GZDhcpgoJG2Az2+7g1c35yTR8BrhUcFMK4ob+ldDW/8EbdMRMWSUfPaEXR5OgaHi9UXLu+ASFzJ
	WuAo1lf7i1FOYzfISsXqZYEEhTpXaafS1IcTCbuP1ufu8pkDrXYXUH99jEZSN8v1BD9bw+Czkp+
	1z6UrYPqpDKDLXNyDToWQWWMtkMv4ltBVjUjx+XPU9GXPwxAySJrhgP430YlqzuQDLFrLJiNzKd
	39QmNSw==
X-Received: by 2002:a05:622a:17ce:b0:532:cad2:539f with SMTP id d75a77b69052e-542b7b0a59bmr93775091cf.53.1793463879448;
        Sat, 31 Oct 2026 09:24:39 -0700 (PDT)
Received: from localhost (h159-112-31-107.euclwi.broadband.dynamic.tds.net. [159.112.31.107])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54312a5943csm41374121cf.24.2026.10.31.09.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:24:38 -0700 (PDT)
From: Christian Cortner <ccortner@gmail.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-glymur: Use PWRSTS_RET_ON flag for USB GDSCs
Date: Sat, 31 Oct 2026 11:24:37 -0500
Message-ID: <179346368381.44447.1485218660714919850.x2e-share-reton@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261016-glymur-usb-ret-on-v1-1-1790a523fd9c@oss.qualcomm.com>
References: <20261016-glymur-usb-ret-on-v1-1-1790a523fd9c@oss.qualcomm.com>
Content-Type: text/plain; charset="us-ascii"
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested-by: Christian Cortner <ccortner@gmail.com> # Asus Zenbook A16 (UX3607OA)

Without it, s2idle aborted here with -22 from xhci-hcd. With it:
19 suspend/resume cycles, no USB errors.
