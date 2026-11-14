Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794699762;
	b=zDsvstNsTYNIqSnNHXxir8GZZN5CZjzFbAnKwgVGqIbge67Big2lm359jGPTqZMPVFX/
	 GFzvlj/Z81FenO0X5GHxUEYMYva6nmHLxOVHkxNNc8cYnl/iX2kgu7sYPUWMQIH1PGGay
	 tQDxJ8GjQYpNeTZI07r1N9TIguWby1JwgXXvEq4xe8QjILTwKuBINffWOP9tO5VFS93V1
	 ecXxf/8n6grjVAO90Z8XSnUMTGm/PCXxEP6OLELizfLCIKEEtfKlDNaeNG0wxpLeLYgTm
	 HsG1Zxbjp6q8A6uiNkooVCpMxqtPPO+faXvr3+MrfIZ4Ta0ppMY5f7so9kIyvs3g58w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794699762;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sS8xPUczV4+FMDxOy+FHgx4wadDCkbOB4fdq2ZplWK4=;
	b=RayCP/biEmtbEHFd/2VlmeL/G6PGeJfnRTbeyNiSYMFt8DgAAyVvaV/unwj2iXBm5L3y
	 AjqBdnTguMSeM14+BXr2m7KVm4UqY2Ob083ikwM25NNBubgwYtyeMaVcHx4lxBGkiUM25
	 AcAeRLfei/QF3pndlgCS+IqTDd8ceCofL+MNDhekh7aTbjPShM9sf2C9PsSeWR3XD9VEY
	 cVX09YJW8ZuuA+kkucoW9z+iWp50ZM3dCel80ebDQ2MvCpnMWrybM0GTNDy0tIxxDpM+l
	 i0LsIHJfu2Ty99lvaAzFkLvMPzFAfOfsoPvBhbXfXJPUJdPcbbp6FI03CY/o6/cX6Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h3uvQOmR;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1219E606A329
	for <linux-clk@vger.kernel.org>; Sat, 14 Nov 2026 23:42:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1219E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h3uvQOmR
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b179528d56so1037618a91.3
        for <linux-clk@vger.kernel.org>; Sat, 14 Nov 2026 15:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794699761; x=1795304561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sS8xPUczV4+FMDxOy+FHgx4wadDCkbOB4fdq2ZplWK4=;
        b=h3uvQOmR0rWs341RwE/hWRujb+w/Acj48NC++U3xqw2uL8vEXibItmD4r/OnQqYlZs
         VfFM5nG7f0KeXDc8YqrX/nt8czV7aJw/bcr9d+RkZeT2kIRtBMRd3meIkWy5DHA0jBs6
         FHly/uqx7ZkK/sQwS4sdACutwS5rKamhGYtUc8QoiDWh9fReO3IkvBRnJEFZHgsDFBoN
         0FKLlJZkLKjehyc/AjjhDjTEfrbe2R21s9COVjlZ0+OKZ3CnE5Nm9vlS1ujHNsb7Ktyk
         gZcWSSqdYPtzzA3/yLLa08saFC9A5/y2sIKju00aLxprlEHL1J754FB43+vgCOCo3jIX
         WeDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794699761; x=1795304561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sS8xPUczV4+FMDxOy+FHgx4wadDCkbOB4fdq2ZplWK4=;
        b=qnmXQOtbG1gukZA6uOEqYDC2PDCNVDBCfD4jwWK4elfWsI3edoAcemgUE0fn4uoaO8
         X1PcMRilQ7Lpw/Oi4U4/M84wMN6zzm9/JhaGJAKsVkRQavJSMw8s+3BW4DGLqs3awN0i
         fBi5bajAIfUSzLkdJaLUEfUQAod6L7L8dwZ5aHKi+OF0VI9HNEFzNFjLBA7TCfz08N1D
         nYAMfAMJ0ZakbIrl50TYwQizm3OMxXuJHXcB04W9yHewxzHvkV5jybGc2r+Y8I8ml0RO
         jfzZW4qnYM1rOPX1MqguRdej2sSaaof6uTAScx9isomNbaotXGKHXgNPSupW7eYtBfcE
         SHmQ==
X-Forwarded-Encrypted: i=1; AL+hErEcxAtYZ1TWIAFOY5pim0y/WxXPVQ1vgz7ulFMiFZenPQtAN+gtEXeuP2IYG94qzRm6kXaHrNM1L9Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/v/Z9k3I7jr/2DX6E3JXix5JGniZqG/LXURc3iVDrlGonTNfha
	v3nm7CPlDE/YoOAURU1FmpRpR3fzKckaphpaWjOwGpuoeay622jQKtgJ
X-Gm-Gg: AYBFou3YI+63VHQhLfIwCxHgYF/q917wIu5NgbvyTPRVj4O/yz0mkzJyQqCavcCvO24
	HNolk1sNr5rkGsP5or/fmgl+3d9uoCnwgyiXEVXjf4xJEzk8fKJXoQ3CnDPs1OJNESBdhMLU0Pj
	jPY5BpIe7v6q8/kmWwaEiO5bZcW+BxsRI2Mugv048d0RiM85ig/piHpvuLhuvhUdp2O9ZgSAATs
	6yd/GBa1QJ7xhSBE7r3z+R1t30Pq0l/FrS70LrDWC4cpf5O8nN5RhmDJPnhbSGEZrdyMcSKpLof
	ysswpSvtYWnS9Gl8p0bFn4DVsGwzsWlyU4VfHLwmcl1dFCavMGRE+Z7961KPJ6UbFgw31iFEaOZ
	vHDhFps4Mwc+OyzQ/PA8qwAhUU4E7GVGIYFnQvpA/nGBINI3gaSLN4xdy6bzhi8E/pYwb4Lp8TV
	fX6Xt+2tASA3Ef5+r5fs9Hi4jsj622BXMVbO8r7kPE0r73Rqz5IIRnGVfYpN08jWVIPaXuMLaqy
	yKAKjNfp004GiNw5kQ5IOUWrs19mij/d6Gt4WtLQtPGOIpRsvOwGxiPsUQNheLLXNY6Ou3qj/BI
	f4SfBppt18CuQJ9ek/KVQzf66ShL3v05S6YYKTx6iWCLvMH7ZnRGiO0vRrpOIlVW+TNsZBSYjUG
	1aNGPdLncwEgTQYW3tWF5k+RV2d708M1vX7K3CZmkqYfkgngtJjiOrwVzvoreXebfGYQv1t9o2k
	PtAiNG0WR6HokwMB//gzTp9ag=
X-Received: by 2002:a17:90b:4a84:b0:3b0:ad42:dcb3 with SMTP id 98e67ed59e1d1-3b1b09fa377mr5893906a91.14.1794699761489;
        Sat, 14 Nov 2026 15:42:41 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d04336sm15755574a91.7.2026.11.14.15.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 15:42:40 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alban Bedel <albeu@free.fr>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 5/7] dt-bindings: clock: ath79: add the UART1 and PCIe PLL clocks
Date: Sat, 14 Nov 2026 15:42:20 -0800
Message-ID: <20261114234222.88337-6-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114234222.88337-1-rosenp@gmail.com>
References: <20261114234222.88337-1-rosenp@gmail.com>
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

Add IDs for two more clocks:

The second, high speed UART of AR934x, which is compatible with the
qca,ar9330-uart one, can run from a 100 MHz clock instead of the
reference clock.

AR724x, AR934x, QCA953x, QCA955x and QCA956x have a PCIe PLL, which the
PCIe host controller nodes need to reference.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 include/dt-bindings/clock/ath79-clk.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/ath79-clk.h b/include/dt-bindings/clock/ath79-clk.h
index 27e31452544d..57d966ae9722 100644
--- a/include/dt-bindings/clock/ath79-clk.h
+++ b/include/dt-bindings/clock/ath79-clk.h
@@ -11,5 +11,7 @@
 #define ATH79_CLK_AHB		2
 #define ATH79_CLK_REF		3
 #define ATH79_CLK_MDIO		4
+#define ATH79_CLK_UART1		5
+#define ATH79_CLK_PCIE		6
 
 #endif /* __DT_BINDINGS_ATH79_CLK_H */
-- 
2.56.1

