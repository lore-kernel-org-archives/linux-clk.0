Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792767360;
	b=Gu/PzNxjohX9DfFEIC9a0/2MIEPmBQIrSLFDo93D4Jsoe5iqpxxJn8dtzkn9N0qAha+h
	 nTwFHs7DYsrpPgX9PffmixI7bA8wLanofKoRMadoD3NM3vw3pFm9hwAxLgYlJVprqiWRB
	 sDeW2Wq6hpewJ/+7tH69beOB8w/n7/RywMo5+zIR8GYnQlnEg2bX26BO4Fa09WH+b6V5J
	 tX1SIego2BIUI1jKHU18eDglAY8abTv+a0HxLBh2VLjJ8zN0AQABOEXdDWRxaFbf3aaiM
	 IqVFbkjexkGgvf2Y1PPHVUDE7apuPMWtZi54R61Succw/7TqrZBtyu+IaCCdDUqxwDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792767360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vB7EoyrHbZim2ck9/2V6ztNSVsZ7Bq2SjbvjQSXWvH4=;
	b=cPPoO6CtoMj3qmLp13URVUBirOEix6rPK0XMNKGU08yx86H4hpU5K+FGxEo0AGSXFFb9
	 O0kEg5RRugdg17FyIyaDbYDZeQpOHWxyWV1sQYuPCTJc+x8F9Fi3YaZsFA7DEQY+/CE+g
	 ayNLH0lqdFgnVSYqEc+EuLopfvxEcC3J/RoUYuwKj6gHQVFDwGI2ggUMf8Efbw69CsMNr
	 4caF5uAEAkgxv58EgBJJ0LkXb53OvBs7VMN4cOWb9Mp0ymPTkWbcn2Yh93r9VUjB1UlpD
	 qxg5IcSwUb5fMZuBfxokt0g7JyRnixdcUxzVEf3MMc84I+Jo5Qwtjd5c+ERLAuR8ZSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=GOR+0AnC;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CE4606A31F
	for <linux-clk@vger.kernel.org>; Fri, 23 Oct 2026 14:56:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64CE4606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=GOR+0AnC
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso13052185e9.0
        for <linux-clk@vger.kernel.org>; Fri, 23 Oct 2026 07:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1792767359; x=1793372159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vB7EoyrHbZim2ck9/2V6ztNSVsZ7Bq2SjbvjQSXWvH4=;
        b=GOR+0AnCNVrcZjEffNum74HOdwjgnPDBXe1iRLRP037zO06nFiOqSSqD6DnLgLZtMI
         2bZKwe5rUezmAubDWZ0BLdgmW8OhsBjGp9wMLvyX2WYKQVhP5Th2Dn8WKNJcKcjpZ5qc
         9TlwU7RZxqhQ9grYFc+vCMesanO3amPd/4Hjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792767359; x=1793372159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vB7EoyrHbZim2ck9/2V6ztNSVsZ7Bq2SjbvjQSXWvH4=;
        b=atp/+HmsT9uBlxySXRqce0IGGW7wgeXOeFWeys/sumYuzU0OphVxV923JwBK6DgCbS
         7poLuaQH4rO5ubhD7Pm7czjJTRGpHJQojbysTkHSIF2Pe9Ts51+VYz8LJgVZMjUMoIxZ
         kjSj8sJp8PWGu0Rh5koT5UpeIskX6AFuaTh3JVmAffIlZt61uo1HftcnWSTb8m4HsOu2
         J3aY5PSWh2ulHOuWembYbBQpO/i+S+XZdrK+h15DEJryvhdsfWQpq6JwFh6jqpXR9o5B
         H3j98mUM63DaiED+wngqnzbboCOf7WOH1HXQv+Y3WzjvRNr9PbsxcloC86kv41PeQyZb
         g9fw==
X-Forwarded-Encrypted: i=1; AKwUvBzhqp2ptlezwFS1/KYWWUj8k/V7oZ2CUTtxjnoRximvKgk5Q2y720raMlXtBH0QBMYfO2QVH7t49so=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKmrvOC6lijRgKOLvvTO+bPspVUJF7F7nDNspIFqpSn3e52vCY
	/vcDU4o6j5A29uVisLuoNTPXG0MgthY2EXDYf9xwI27ZoKFH8tyYJn/jocjp/VtCwfY=
X-Gm-Gg: AYBFou0cKjOrePsEc/3gvB08lFrYMN5rCC0l71uaKseuKNXr/EyiyOQLamegC8fCHLM
	qS2IzxqE5r8zNrlxUaaelO23WVOlKyqHA8O4MZkAB710p/pLzlkn6aWQehKFuH858oHONpw9+xo
	lBdCD1voZhlqxW+xHwgbSKBhHleFwxcNAISE5hYcmYwL0lci4yr10miD5dt2SfefTja3sFtl9cf
	4ZA9Aypm5FDiZMdIp2SNtm0g/M+H3S+EtV9VRHO+TDsysnrpGDNsQwyB7WT4Z5xdGsuk4ectzEN
	AgtZsqHn+GIG18Kpuneb3z1ZlM7ZZRHE54tralGU7CWz4SrFhzr2i4+9ojmaxDHENhHnxZ6spBq
	RQNCpfVaGBUWgGSZOFDifP7yf7efcr7QoaoIXdkdst83y3dKAjbdpkZfVkRR3rCI+fpgq2AWPz/
	weaitGHPh9JadxkWw4hVTyNIWz1pl+fBGqr1/GEdGCYZkAf9RfXWZl3qEXOOEx1FO2dwiAZFymR
	jlXsdQYc0O84NpLXLtAk2/BTpO/rxeS8MjfrOi0SUBbCyO9LtIObuqHrl4OrqNCCL9roxY8RQF0
	VmGVUzBbkwhlCLieyDpGR1BF1Jh/LIlPfrVquoMnq3B7XMXMa3GfUDQTVDY+/tCr4x9CHMi/3Y6
	jzsFjCfVEUj1WclMaoHaqw2QZyU853vWFhE3UAnYD7HYZsWnRuZ7eTg==
X-Received: by 2002:a7b:c303:0:b0:49e:795e:ba89 with SMTP id 5b1f17b1804b1-4a204bc31e6mr73887275e9.6.1792767358753;
        Fri, 23 Oct 2026 07:55:58 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d42f884sm226760f8f.57.2026.10.23.07.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 07:55:58 -0700 (PDT)
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
Subject: [PATCH 0/3] clk: ti: dpll: switch spread spectrum to the generic framework
Date: Fri, 23 Oct 2026 16:55:29 +0200
Message-ID: <20261023145555.3578469-1-dario.binacchi@amarulasolutions.com>
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
so the series moves the TI DPLL to the generic configuration and drops
the vendor specific properties.

The last patch applies the configuration right away, as the clock
core skips set_rate() when the requested rate is already the current
one, e.g. when the bootloader has set it up.

Tested on a BeagleBone Black with equivalent parameters. The
dpll_disp_ck SSC registers are programmed with the same values as with
the vendor specific properties.


Dario Binacchi (3):
  dt-bindings: clock: ti: dpll: drop the ti,ssc-* properties
  clk: ti: dpll: use the generic spread spectrum configuration
  clk: ti: dpll: apply the spread spectrum configuration right away

 .../devicetree/bindings/clock/ti/dpll.txt     |  6 --
 drivers/clk/ti/clock.h                        |  2 +
 drivers/clk/ti/dpll.c                         |  8 +-
 drivers/clk/ti/dpll3xxx.c                     | 98 +++++++++++++++++--
 include/linux/clk/ti.h                        |  9 +-
 5 files changed, 94 insertions(+), 29 deletions(-)

---
base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
branch: am33xx-assigned-clock-sscs

-- 
2.43.0

