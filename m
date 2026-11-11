Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434262;
	b=pg2RCL2TDHBdQxrF9O5pVFZGh+csVt/EMRA89STrdHWD12mAyUY4j7jQYbcwcJhoG2GZ
	 aVeNMZmsaIlo+quIdc5t837805fKpWgQIfx5IYBY05Ao5bajyXGlsRCakAytoBCftyQV4
	 KKAKDWWpYX17posvw4UXYq4DIcwWuclumc08H8He+UI3zf51crIasoKbp3tJ83nVK+pl7
	 o+l9jg6OGpz1o1MMqeXzssw0qWMoJw1Ahu4JoytgEk+v+25FpMOlCvQpYk2DwJ4y17WGG
	 r2ZJVdtAvyXuM1p1pKWn1RPGiNUGgfDJi69DEvj+Mpr7DZRFZLturVswd2wMRdBOVtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434262;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0SxbXbiAkUu/9xk8uRLM8Bu8VTt+3N8T+dREW501N3Q=;
	b=kSD6kzsNiZ7X833OFZV+qCXncUXpn5BIm2h7fb35KplS+RgnlaN2JILLlhEdFpu71HuC
	 AKuZAF2CgEoQNycVs8LPa+hUd1RRwlhVgYIfAJF6fEr3F/cG3jynRyvqtf8RxzWf/lfgS
	 VWP6FfC72L/wnlgNvOqS5H15K6TaZh1TFzmnTy4NHHpv7Dnr66EaO38lZzoqkiyY4oOqC
	 OYYc2g6CuCQh9xDeSchzgCXwDC3wLjd7crdX+SXHpamspeVX80aRKzF+xAGCV1Xy9dT1f
	 pomWVj5s+O27kT1GAuITw+lk33sd8XZdjhVa8fto8+15RS+MtS4sI1Scn+2boTyvduQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zye+u06M;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC2060A2612
	for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 21:57:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EC2060A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zye+u06M
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so1755790a12.0
        for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 13:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794434262; x=1795039062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0SxbXbiAkUu/9xk8uRLM8Bu8VTt+3N8T+dREW501N3Q=;
        b=Zye+u06MWPnI/iZ9Dvf8g7kNiCqjl8bBx5B9PgvrMRhL965Tb+ZA81cHu7ySSpTHRa
         /vN7WyNneVWe4nb2axIJEbaOE6JLWqKdt45FQOi3j/WT05ZlAD6eRIlxPX6IykdQ2zCT
         XZmXrCggIgVSQMRZj0XpsYTP00aFNq7A0fFaoSId9V+rqnk2Z+nrQPr7eI2GaaYS4kXv
         WRnUdG/+96JvWJeH50HjrK/XOZGRBlVPPhGuFmmaMEx+euYJcFBH8WQ+Zk96dGKEo7ic
         3OjUsz57osZ3fPVTvVjlcRDn3I1xf4TIQ+5RVhrcast4d/9TUdXu5B4T7DCeTssuRBYG
         I4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794434262; x=1795039062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0SxbXbiAkUu/9xk8uRLM8Bu8VTt+3N8T+dREW501N3Q=;
        b=sh5zGR5kG3i4Ihw3OP4cFhcdG8ZToWsoQmn3lLS2KKprw9meWt+gRzYby2uQ5V0pnS
         zKAAC2Q7ZCzSATWXFwZGeZ203IYDzsCG+TVBWSP3QchjZdRtlFcdfm5uYc7IXt+kEOzj
         md9m0dB9Sa5ttEFkuXhKbAy5LIMtlBnlcie90Wg6w1sBNs55/+qhsCuUCzcjHX8cnNyR
         mj+pNdADbCMOMPzzHTGBZ7+g5yk6TiEiuL/ko8xU5vVwh0609SYDeBg3PrN+cFy8ZF9A
         NAXut+lgvR3grPySmZVVqnBqWEFqX/2pTya11AaDgp4MOR8M5M3MnavOlp8uMEJUlGuk
         0Y+Q==
X-Forwarded-Encrypted: i=1; AL+hErFJ6C2hQdlwvbJER0yyVaENgeHrYfDlx6R3NqhrbtpRMI/Sx5thvj+nji6TjHo9ryp4PXpFMeYhFfU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ab5G03P8efOGrL7JKOuRMTRCLtUjiH2AhnLT/ZyNiYj2o3Exk
	5/Zroh6OCTSHLCrGyzewxoX9iTUVXwr6IlzjKNpEO3zeQkd15FTDgtol/hLPxako
X-Gm-Gg: AYBFou0dZ058wycDMip3Py7IV+bodo3osf4xK21JFzghJ8lei2Sx+XwuBqG1DqDZTcm
	bcRfSyce/5TNRTYvHZVgXs9e+ZhFUcvAjrC4E5RTlPjtlwWc3jp0QVr5xGoL0jLH1t7BeqIk4CX
	bzqW8tDYo5YK86rRwNhZpVXElk8+beQEMlfS42QohNKpPnAxtDheQivJll9thQm7uABOqficeA6
	St+eKEfftya0PX7aks02ZelUUpJYEGN+2+OYSwDMVtdsqEerJoTTwCUF91lxpzN10RKiDYMdrv7
	1OQD+FwWhP6XyteGbl8VC+dz+qkEq6bmhvrC1pIckYodhREE4VXj+bOQQ/FWJ3WQJfWORnXO4Ea
	v1YvQMxIYDQ+ngyrTc8Fe65GJGEl1bYz/r+YWD1Vh1pXygdDYHV/3Dq5EsZUU+/XG5WcA9aAb7V
	/wm/LjyRosoEOvfqm6vJcC7Y0z7c+F2ezUKZZHZ8JIxvQMEwcdzU3saPcI61MS62h3FnJSWOnDe
	6gEnsnDUWEu3MvvoTvnLLs/bpHDpZVDWNETzZ4d1x0JUFHzUs+hAs5gnSvil5UJX0aTppHZbiLD
	NWtwAvcPIoKHjz/fep+JvzcnoNX7cC4Hyj79ugYOALD7INN2UZNCIkvMBwV+vCkwOlSg0fUnqai
	RWlVHA0T/f3pEwLYmbFVGTaMXtjmDvxImgu670zM0LzuVWj0hgnyC+himakJ0u2tKlJdZFthrpM
	vUGQ==
X-Received: by 2002:a17:90b:2649:b0:3ac:7749:2f0 with SMTP id 98e67ed59e1d1-3b182f2381fmr3592513a91.44.1794434261873;
        Wed, 11 Nov 2026 13:57:41 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce556dsm965429a91.6.2026.11.11.13.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:57:41 -0800 (PST)
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
Subject: [PATCH v3 3/7] MIPS: ath79: stop using ATH79_CLK_END
Date: Wed, 11 Nov 2026 13:57:25 -0800
Message-ID: <20261111215729.10683-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261111215729.10683-1-rosenp@gmail.com>
References: <20261111215729.10683-1-rosenp@gmail.com>
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

ATH79_CLK_END counts the clocks in the dt-bindings header, which means
it has to change whenever a clock is added, but it is not part of the
ABI. Size the clock table from the IDs that the clock code uses
instead, so the define can be dropped from the header.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/mips/ath79/clock.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/mips/ath79/clock.c b/arch/mips/ath79/clock.c
index 6a8bef782186..55d8ef8c1c8c 100644
--- a/arch/mips/ath79/clock.c
+++ b/arch/mips/ath79/clock.c
@@ -25,13 +25,15 @@
 #include <asm/mach-ath79/ar71xx_regs.h>
 #include "common.h"
 
-static struct clk *clks[ATH79_CLK_END];
+#define ATH79_CLK_NUM	(ATH79_CLK_MDIO + 1)
+
+static struct clk *clks[ATH79_CLK_NUM];
 static struct clk_onecell_data clk_data = {
 	.clks = clks,
 	.clk_num = ARRAY_SIZE(clks),
 };
 
-static const char * const clk_names[ATH79_CLK_END] = {
+static const char * const clk_names[ATH79_CLK_NUM] = {
 	[ATH79_CLK_CPU] = "cpu",
 	[ATH79_CLK_DDR] = "ddr",
 	[ATH79_CLK_AHB] = "ahb",
-- 
2.56.0

