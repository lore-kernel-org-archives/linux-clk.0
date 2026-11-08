Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794138469;
	b=e7aVFeb6UEIgLdJJPodlzHop6auW7uPmAiRbp6AA53cIBObIzBU6lNVDfdU6GmN7nBIl
	 7HD0Rz8+CcY3aQFRBewDOW5mScVSFzMm8iehTQvEatEuMk7xZLxP2d4xKMuJPP10KnKt7
	 cQroDrXswdU92+80+8BhKRj8/MbdiIaxBijnwhXBYWdqBeRc9AyV8XfTWgzr4HwxcGfXq
	 kOsmWzmdX4c/+KhUo1gt/yQXr06bOvQNAdqloLRhy3p3xStG5An0NKxwqzWetW5XFjMW+
	 iWXtray5Y+6RGMzP3/hoBBQtjmQQX/sWVoUDIYts13domFYkzIRA02vtrDBqs8F7Iig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794138469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dH6h1kBUvb/ripshwEjaT3O4DrKwOfPQAnnj8h0Dg4w=;
	b=TdF3C4d0RYRbhS33DT9mHU376Ht967KgomFgMVqRtjHPv3R1NiwnkE3LLYiqvJdsb7tM
	 coEyw4YDWLj59ApoobE2D7euv8cjlh6MXZm2Uhwc7kxd8hkxHLw+hYhUJk64CmIK8E0C3
	 HnXyXD4SNiQs3Y8bpfrwZdY4qXri9wXiywI9NIcpabYgsDdskdsjGEFsZsnnLZvOPKk1a
	 O5aMq8WCs57qNVyRKDWOBGVt03YpoUBb6/i1IX34fA5bboh0g5/zHiuPK21LTIMNXPERb
	 Hg4DgGCBr1lz60/Wd3mTHQBpxrwapDx670y9Jqo/jv/ulCSd2Y3iCJwxftUhw/6scJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=TNZIiP2m;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2BF606D807
	for <linux-clk@vger.kernel.org>; Sun,  8 Nov 2026 11:47:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF2BF606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=TNZIiP2m
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso3419366b.0
        for <linux-clk@vger.kernel.org>; Sun, 08 Nov 2026 03:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794138462; x=1794743262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dH6h1kBUvb/ripshwEjaT3O4DrKwOfPQAnnj8h0Dg4w=;
        b=TNZIiP2mx/Dm+kFpt/r1t/gzDe0z+B+AK7jZUUJVHZpQaqckKljPzg+WE/0kBtU+LU
         odAmcgVPrwsYZ1LD074BZUd5uktTD309486lqhSxLZDOwmdkAVejFdzQQvmgxxr8rsIy
         S4zkq41lg4u/Gr9jLBMqaDftfK8631vgHka5rqjiQDQNZjkgJEX748C4OTUa3OkFTMXt
         lF12ALvJkxrWLdyNixF73d8KRL7gYbfOL6cl3/b1b3acDicR5gsAyDE6R1vm/aTx8KVs
         rysc7GMPhbWTd+ihXr7DxMSjDjYPD0U+MwEqdrq1OlvCwWFHqceYaKulD93/xsJNMEOx
         Fs2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794138462; x=1794743262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dH6h1kBUvb/ripshwEjaT3O4DrKwOfPQAnnj8h0Dg4w=;
        b=r6I1jyPqOk8CW4CeA1WPSdPoZSA8ij5m3NDMYelwlKpIl/ezHSSDfBGkUKxO7JuesX
         gnKoOaIduO72aLovv72GGCMSiSqwy/h2FEmZwcUOdsDjVDllS7MazubnDAZbRLy00toN
         920hhFdsMRIiN9ltbFrRWEWlbRGg6LdhaCQwmVQoA3Hb6JscpOAMp0oJfp21SdQM8xFr
         FBrGOC2YB6oUKBmhwVsNwcDi2BhF4gyBG6MiIkoYwwqfnFMBPQEdQhaH48YLU/qGCej9
         1aCxidS4DlG/W/bOwNwzstDip6oEnBOVAq9/34EJ3hguM/bHcuUXqvHb5vQpghK9wxgQ
         8lhA==
X-Forwarded-Encrypted: i=1; AL+hErHURcrc07EAqZc6oxXcDVd0PJArIhbBXAnMFN+d8ZomqCvfa+0P8ll4dmFqZMgDEpAIfkAA26VhcFg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/j2q4vAAg/gTBpuO4VxBsSxKgP7FHLh5U75G/1BEkScqtJ46Yw
	mWmBH1vRJYsezoPe81VG784CBgNqM5HuVTmlkf1UFoR4llZWCVyFaTYetiqG9CvgvA==
X-Gm-Gg: AYBFou2eIX8w6YC+GnWnoNPbSZ/KPSJ/ic/4e3Svra1COvmXFXP2CgYyO4QJdloJESK
	j09j13GRH3FbGCxE3PfycXUx+bUR1ZpQbpfLPM4gp4eQgfueSgZGR/HCsEj00FnqbH7VsEVv3r2
	VTD8VhnEM5EEUgfHk/537YsqxcYVTahbDRdMGTZ48kVbLPu6b04cp3IlLKJhaGgOT9O1ILm4x/7
	DI93lKdlfDjKJaNdoDkCIRN0TzLHqiC1d5cTDCMGbHd1s3zkJkxmkwanxdA2jrq+f0lbyZHNcd8
	PpeN7FewkJTaFvt5NrTwIjHXlb2EVTrsnHoDzroO7WRc0wup2dEbObX/fFLotM3hhLWcdiUkmMo
	99JWWzzC6LrLez+OSQfgS0ytxdhMxwhI7bfrw7YmQRvPi76xlwKd5htGsh1AtJfmuKUf1qpDBFE
	tTiP055pG1Y9xmRMfmI1sGqPl7wA2sNiK75DrOmb94LA1PCdw1bf7kMr2ntF4Xo5UHko1p77xlw
	d4UcB+hBaLUf3GRC2Oe1bRMeAANwSByCIu3Wv3pX2ZNvnLLYlfd7ebOoMXIZKsbKWP6ZYxWyIUJ
	hgO9tWtk78OUL68jvq3mPjCx/QdFvUa03CCk9FXUYndnhqvTYgDVKr5cGnmtXpXJSLkjXLq5/BZ
	p+JwU/C0OYGoTNoQAZPkNJj1LFRhsTfNHA2lU2vFngnGcBJZj5X92GoAkL7QUVr34acsYTufYTo
	Idm2Rxjs49fieySfu1g43C0Gw2eFm6yTCXvzxJRVLFvQP+lJbrlAgTsz2StlxUz/e1bt9fdIqvs
	/M078sqSmLjYZGs+8XRn+Mpvue+gPwsqBA4rky12CmLJvpcr0cb4kUZDh86CKw+vA3nXdQlLtjf
	iCGG1mycR3dTqXpf9RI=
X-Received: by 2002:a17:907:6ea4:b0:c46:8b87:c212 with SMTP id a640c23a62f3a-c4d6db7c9b2mr101123266b.20.1794138462143;
        Sun, 08 Nov 2026 03:47:42 -0800 (PST)
Received: from Desktop (p54afff19.dip0.t-ipconnect.de. [84.175.255.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a999b01sm56346666b.77.2026.11.08.03.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 03:47:41 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: robimarko@gmail.com
Cc: andersson@kernel.org,
	abelvesa@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	taniya.das@oss.qualcomm.com,
	ansuelsmth@gmail.com,
	john@phrozen.org,
	konrad.dybcio@oss.qualcomm.com,
	abel.vesa@oss.qualcomm.com,
	krzk@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] clk: qcom: gcc-ipq8074: Align CMN PLL inputs with binding
Date: Sun,  8 Nov 2026 12:47:41 +0100
Message-ID: <20261108114741.125238-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026120920.1667982-3-robimarko@gmail.com>
References: <20261026120920.1667982-1-robimarko@gmail.com> <20261026120920.1667982-3-robimarko@gmail.com>
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

(Resent with the lists on Cc; the first copy went to the To:
address only.)

On Mon, Oct 26, 2026 at 13:08:14 +0100, Robert Marko wrote:
> Keep the existing .name values as fallbacks for older device trees
> without these optional inputs.
>
> Signed-off-by: Robert Marko <robimarko@gmail.com>

Tested-by: Julius Bairaktaris <julius@bairaktaris.de> # Xiaomi AX3600 (IPQ8074)

On OpenWrt with Linux 6.18: the NSS NoC clocks run at 461.5 MHz from
bias_pll_nss_noc_clk and the PPE and EDMA clocks at 300 MHz from
bias_pll_cc_clk, with no orphan clocks or probe deferrals, and the
EDMA has been forwarding WAN and LAN traffic for 20 hours.
