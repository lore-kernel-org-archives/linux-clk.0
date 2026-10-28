Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793173482;
	b=HheWFtO3zy/CxvmLT+eBIW34DcRR0IBCtKXXMf1uScGc1kRgPCMGvwjZZEqpN7n1ByyY
	 lce7QcXJ4J7H9a0GFncwJ+CekPx57QKTQt7rL4gA2HKXjbPLVnPqawGlmqEJ3Z+eOMAUi
	 i0LNmCVDuGcYdkb2CX3nGDY4vQHNPw05ybytRFuDt2byZHMseHbewn3YUVWv8FbHF2eQL
	 BrOY/FAUlX4c6E0J/W2vCwG0sfBiIpyULwm4+lzTIAXOHoA+z+/60VfYHfah78z8eDbYV
	 l9v1asvc788qpkZ+k8UyT9+8D5Ex8Wlxi3MZZTI/4bjO9ldDrBr40mh5SDL3KuOXAHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793173482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9PPD/mUgGF3odbO9HUc+ZEDM/rOsDf1Ah7YKLsgVXgQ=;
	b=JYWTf7pTs5Hr/fW+gvjRHKcBQvubr47Gv2xDce2xnCUJl6Dt7YmMJq5r9Dr0jrHJ+WLj
	 whVlGSRS6kLUKz1DVNR1jXUZtDEbH+ITljh1/ekUmTzCRHGHi4W1ZLapSkk3GpmNgDqKB
	 vZfhXe1jGM3xOpUzzzUBxNvX4eRY3Czlar4rqy7Tr0Jrpsi/FQkUnPVSK4fpsTYx485Vq
	 WqTq93dL88CmfgRtOvWXnyJsAbBjzs0BJNHe1YEVjAfU3/v2O0fsMU/5FhNWQDk4Ci9zR
	 yVfmC2HY6X48dhQ4XTCYOFPSpc4U7aWk8y2NIZO3hQpOhXQSgHxTnigf3wakzy3TPaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=o+dQgdtT;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70D8606A31E
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 07:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E70D8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=o+dQgdtT
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso4702255e9.0
        for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 00:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793173480; x=1793778280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9PPD/mUgGF3odbO9HUc+ZEDM/rOsDf1Ah7YKLsgVXgQ=;
        b=o+dQgdtTPUArIk8G4DW9Oqsp764+f8J6aW0ayYaDCegAjgvjAOMBnfqzTJSmDzmm9n
         i+NZAC2XlxKHwZKwEPJ1B5aeJF5Pg1JAVxDHGVWJXAXwG7tAR4hxMgaOdwgppP/CRpck
         ruDoRW+vGo3C1vOq0mA/5x9Lp++jUhBtyGI18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793173480; x=1793778280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9PPD/mUgGF3odbO9HUc+ZEDM/rOsDf1Ah7YKLsgVXgQ=;
        b=1sScQEEmMumd/1ocgPLc+FfOfUigAXYUH6ZhkrhQdPFFPAmVHNdq3OTWosr8y5zYmN
         llrTrCty7fowO2a4jtXJQktmrToCUie5LrDTGLo1Cqc7DfB0TllFlGVv7SMnpNPTEteb
         4sbUsAkfqTljLSKC9nr48dPiut3/4Pnh/9UzoR4sYx0VyS9X5Te+jUMGArKQeCtf66wQ
         eHrH0zoVPBjQVKBI3slmuJ3tL/Wf8haeh62KAiQQynvy3II2/KgWS35yzbrlLPjU/m16
         AyC9z5vkEIFb6jcodHikfWwGgQRVr9stOoaYO3QKO6bLh9JtMgezggSZP96bHMdMJfyD
         /7UQ==
X-Forwarded-Encrypted: i=1; AKwUvByCL0G/LjFwhWbZ2RhnQ51lngszbJctlqFr2BGnGvkva2jFAwVpENR3L4chGl7DJ7rS65wQHSE9PpA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtX6PFJYdCiFFhqBkrSypAcMV8w8nmPy7MF5tEpm0sBrkMtaOA
	CSXDdvroOnLVSngE3eiE3asfP6euqnI/pwsNU6ydq/4prCFeUz/5WQb0QYtlQpEPVzs=
X-Gm-Gg: AYBFou3ElQDduimlTumVOMfMibBI+yCUKEZcshCI121erELheR40TQVAYxCzgeZ9N3k
	OQ82kvK01p/bzx5pSB1zjsCg3bYIU5pbmcFfLnGpDBQJRD11DWWdPVQZuaWL43hWSd0nkTE1Xnp
	kzxNHZQh+8v2sCaBkhVOruEqHZPGxegCoKxP2xgOesQp6owc8PtQfboKC+LD1sOQ7JxPv/U1+xT
	KTLEvIkQKx2t25pCuWEBHsplKVHsPIseDDwrDlb+wCEOtirMDnRmF/vcyQhP9CsiYnSl6Zzu0S/
	KOOeRCpZttzI9biqBp9ViQ/TpNAbiUrTmiMFrO3VSwPMxFQSW16WkfQRapIYuN9CLdoP8916r2c
	EOZ1DWoed3cTD5prK1xaaPFlEh1i9lpZWqpWs70yYGNgGN2/e5UDxirnf24hqU5r+gJRhxyEZgq
	5hEjpLcsEv16MRNXEQ5zZNCLnOiwTI1tRJQJ3DJotjo1b0DjFazlJp7ogOJqJXpHiX7HiB4ndT9
	6S5Am1CLuTcUB/YlnXrNrislANKZ0nEvvDlatQtWVB1Ge1Y+VPS8jWlLRVe1lKOrqA2p0TukDmo
	j5icZQB8o5Yi85OqCKJ2ErkTX9X9PI9Ha37pK2DwCK8cdSyEnoTyGgDBaPVFsWsWMmcOloym+XE
	jyDBRHzEjfMgZARqUEZ3f6hJwbGBaNmKIAkv/OfW8qKDxf7LElBr4JOuR7AkW9jtM3XtU7lJSYE
	TTxXvMaZyl4/mICLdMXjnLGc2V9EXVaEwbClUzj8A5s57wZEo=
X-Received: by 2002:a05:600c:608c:b0:4a1:dadf:9876 with SMTP id 5b1f17b1804b1-4a967016833mr27902555e9.23.1793173480359;
        Wed, 28 Oct 2026 00:44:40 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e412cc164sm25324882f8f.7.2026.10.28.00.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 00:44:39 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Tero Kristo <kristo@kernel.org>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH v3 0/3] clk: ti: dpll: switch spread spectrum to the generic framework
Date: Wed, 28 Oct 2026 08:44:06 +0100
Message-ID: <20261028074436.1958132-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
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

The am33xx/am43xx DPLL spread spectrum clocking (SSC) is configured
through vendor specific DT properties. Since 7.3 the clock framework
provides a generic API and the assigned-clock-sscs DT property for it,
so the series moves the TI DPLL to the generic configuration and
deprecates the vendor specific properties.

The last patch applies the configuration right away, as the clock
core skips set_rate() when the requested rate is already the current
one, e.g. when the bootloader has set it up.

Tested on a BeagleBone Black with equivalent parameters, set through
the deprecated properties, assigned-clock-sscs or both. The dpll_disp_ck
SSC registers are programmed with the same values as before the series.

Changes in v3:
- Deprecate the properties instead of dropping them
- Keep parsing the deprecated vendor specific properties
- Skip reprogramming only if the configuration is already applied
  to the hardware

Changes in v2:
- Check the DPLL lock state instead of its parent, as the reference
  and bypass clocks can be the same clock

Dario Binacchi (3):
  dt-bindings: clock: ti: dpll: deprecate the ti,ssc-* properties
  clk: ti: dpll: use the generic spread spectrum configuration
  clk: ti: dpll: apply the spread spectrum configuration right away

 .../devicetree/bindings/clock/ti/dpll.txt     |  9 +-
 drivers/clk/ti/clock.h                        |  2 +
 drivers/clk/ti/dpll.c                         | 20 +++-
 drivers/clk/ti/dpll3xxx.c                     | 98 +++++++++++++++++--
 include/linux/clk/ti.h                        |  9 +-
 5 files changed, 113 insertions(+), 25 deletions(-)

---
base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
branch: am33xx-assigned-clock-sscs

-- 
2.43.0

