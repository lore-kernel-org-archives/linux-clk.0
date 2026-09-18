Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2173B47ACCE
	for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 12:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789733129; cv=none; b=RE+wcnS1tdxlxgc+7VsoHH5o2mZ7vc309ZYrpSIwO/cTFqlMRPTYxAiOODIApIWas0+pSucDByWfDprI+ZPZYJYBsiK0ckMCnHoW4N43yyV5SAvt4Tt7P+VhdzZehtys3lHPxfict32NhwW9WsAdXwh9PuKhVxQ+Fvhxc4dHZ1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789733129; c=relaxed/simple;
	bh=K0/AdUj3KM/bg4Lw7l6vPYmAnKy+pFldBgXjVVQfZww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CvSzMhACTXLDctlOAlF9ZkLmvfsTzC9Ue/lN19damVWr17/LH3/LN4Ji5Efe+ceQ9JP//E/BA9hgFJsLYQ3vF95AqInugSIr1k4dWKMBIeeTM8ec4ZlKBf9wlGydOGLa4LMi9282V3je/adL3XbDFAa1rs11sApKuJInFGEkokM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HDs41Gl3; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDs41Gl3"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-486e1a044c5so405663f8f.3
        for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 05:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789733126; x=1790337926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/+5N3eN7ASbvgkLS4Pu213O3p6rNfiCNZSfRMqAlfbE=;
        b=HDs41Gl3XhhlKzL0TRwpmOAaQnDWYMYnVw+FoGv3+uekC89gESmM2AGIKYkalBgeOi
         u9rjp0ZmMCIQRbxSr1AhXh7Z4F+B0PF++SqoHAkxWU7mBVA8/tFsySvmvxbitgXP/ZJq
         rXxxCbQvNI0WHvs6OzzMxE9UrLzzyV+R1AuunXg22npOSQ2yofWpqsj4CjjdR9ZvC0Be
         iGIKmCTbINk6ti4Y089D6MMgv5hrxynHVv9SVBdfh+PqFtesuRFTwgtV+wQ2NbVMdZUv
         sOzlYR7FCq1WQaZcTDY7qTN9O0m8xang9ueUo68IqX5Plbjl02DcRazcdYXBYIaPKryv
         iaYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789733126; x=1790337926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/+5N3eN7ASbvgkLS4Pu213O3p6rNfiCNZSfRMqAlfbE=;
        b=AhWmzVk1CG3OxLmemLQILGQbFZNFTsoV67H5g50x2OR6LZ5qNSK0N8o9pSEzZwnCCt
         dfe+CrnltsBvGT6VSczBCxOecO9LuuUZB6EYS1eFTbUL14myxi4dfQ2lroWgotWFrSvn
         JQp+4tzFILk2QB86UNPh/rgT0J+xo+CsLmSdrrZ4Ftd8XGxB2Ui/l9RqG9Rn0WAfHdtm
         usnCvgh71dGHh4N8RvLP1WAr3YYz0uBOlMjxi5+SRWrbPbjfXD23csJoDIhfHV1a/OXg
         3SZ5cvzMoEMAHddKEXcs55HYlChfzc2ywpZE87ZpCwZsgXIgJ0HleYXr8IDc3DaKO8JB
         d8MA==
X-Forwarded-Encrypted: i=1; AKwUvBw2iGporX/nIg0sBBfHyKNCg/Agkqb7NCqbetTrWK95Zac6ljZVWRr3kUUEbrgKxPaMbr/98ibMOR0=@vger.kernel.org
X-Gm-Message-State: AFuF++mhP4dXEtNaxGPD+vYGjlFZjJxOpmBCho/nvdkHAWpyH38u5Y38
	olZBEchnqTK752xTgcmeAFzja1ROGlulM7ThN7mh8BPFNJY4jq7JefQe
X-Gm-Gg: AYBFou3eJDRk/CMpCHzZ1LV0xpGhi1zuVg2JARLE1Kx29c7pfzx94FK1p07BoQJt2Qf
	zP3WJRMSAvBe9xIkIVvu7Mn/sJQHqrGGClZNYSOoDf6DljDf+O7en4VZsQrGqW7gBBxGTv7ezWI
	4b6d/9oMGTlJNiq1I6PV0Z/ZhOL9r84mCS8hVcjRWW+UXFlKUDX9n9X6DlODK4NK9NpfWewLpqq
	DD8bOdFcNt7GghU8S/xt1KdsTG7UXTMb9zZjwQM7v+eTQebeY5oG+6YIo8FNwneBeQYDDxHWYfB
	v8On8DXSYF0/qYESIozHfoAinL59w4ZD0RawuvAA0vrE9bhMj3PmmA3xc0YtdpOqIy/i/2Bmps0
	jIkE7ZQ45bLxXsnyQ4NQVPlHMpB45MfmPIq55OWN9HF780Dk8dTs58f1WNO8yOHqsoRrr1BvFFq
	B3RP8pV7rQ2yA9HhrZDSznzwFWvtlUFPU2bPL6tn7Gy+W/IU/kpyZWfUoaCicEqyUTNqn9pZKaa
	x+fZSQg6yrw5hSUzV1zbFcVrDFo5UBWuMItd9x+q3n9X7r30w==
X-Received: by 2002:a05:6000:2c0b:b0:487:342:d143 with SMTP id ffacd0b85a97d-4871e269474mr3130746f8f.33.1789733123502;
        Fri, 18 Sep 2026 05:05:23 -0700 (PDT)
Received: from VivoBook-ASUS-X712UA-M712UA.lan (public-gprs688668.centertel.pl. [5.184.233.93])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871ff3a8easm3703919f8f.9.2026.09.18.05.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 05:05:22 -0700 (PDT)
From: Stanislaw Pal <kuncy7@gmail.com>
To: Gabor Juhos <j4g8y7@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
	Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	Mieczyslaw Nalewaj <namiltd@yahoo.com>,
	Jie Luo <jie.luo@oss.qualcomm.com>,
	Georg Seema <georgseema@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-ipq5018: mark 'gpll0_main' clock as critical
Date: Fri, 18 Sep 2026 14:05:20 +0200
Message-ID: <20260918120520.140553-1-kuncy7@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918-ipq5018-mark-gpll0_main-critical-v1-1-fbe8f27a0106@gmail.com>
References: <20260918-ipq5018-mark-gpll0_main-critical-v1-1-fbe8f27a0106@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested-by: Stanislaw Pal <kuncy7@gmail.com>

Tested on the TP-Link Archer AX55 v1, the board named in the commit
message, on OpenWrt main with kernel 6.18.44 and ipq-cmn-pll built in.

The image carries your patch and not the ipq-cmn-pll one, so this is
your fix on its own: devm_pm_runtime_get_noresume() is absent from
ipq_cmn_pll_clk_probe() and the CLK_IS_CRITICAL flag is the only change
against main. The board boots reliably, with no hang and no watchdog
reset.

/sys/kernel/debug/clk/clk_summary shows the flag doing its work:
gpll0_main sits at enable count 3 here, against 2 on an image that keeps
the PLL alive through the ipq-cmn-pll reference instead. The chain you
describe is visible on the hardware as well:

  gcc_cmn_blk_ahb_clk -> pcnoc_bfdcd_clk_src -> gpll0 -> gpll0_main

Once the board is up, gpll0 has four other enabled consumers (USB, QPIC,
MDIO, BLSP AHB) while the CPUs have already moved to a53pll. That
matches the failure being confined to the probe window, when none of
those exist yet and the CPUs still run off GPLL0.

For what it is worth on the scope question: on this board the hang was
reproducible with ipq-cmn-pll alone, which is what my patch addresses,
but I agree the root cause is the one you are fixing here - any driver
that takes and releases a clock early enough can pull the PLL out from
under the CPUs. Happy to see it handled in gcc-ipq5018.
