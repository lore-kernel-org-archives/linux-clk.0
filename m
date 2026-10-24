Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792838054;
	b=5JfPYoIydD2dAkg76/MjqaW/dXynzMJhkUTlYOVP7m7lyHjS32sP5FwQ3VV/VphJbHbN
	 XZLPoBOInttKF7D43YhSL98bEinTow8k1IiyKbpIRgkgNgRomWKh5XP0cBAS3FZM5ZYKV
	 xxIn+Z3CqIS/iD1m8RN/IXFJSUn0u1LQz8cNeImmtWjQqMLJww7HyDLjGeZwnwrDVzg64
	 h5NnJEr5pXgIAUwYjoh4vtQWBTsOCnyFedC6GL96Au4S8sG99Kwh9Fo6u0mDe00ljkUJ5
	 VUadGXUw9OiZE+mjqiX31I/NTxOPKO8dR4BAqbBG4WvPPaNTshoPsXTUuWDNGu7o1Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792838054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=A5n4SrWvMlC2EiMhPFY7DM1ChkFypUIMEv8fI4m9dNU=;
	b=2NPGA1kkiQk845W/EHlbZwNXB55pZCbJlvY1BvzzUPocPIbY7jb1XiefmytvFLtb/R3c
	 VNJtuaeeD3ENbFNAUud7WSQp9HY+hD7Tzxh+WPksO6sPIGsqBEK9urBVFcSS1HLPmK71g
	 zaZIdDj0OuWfQcTo7Q/qlhSs0swNWwGA5oNRHqgpmWsETwTOEnt34xRFiL9wwrQUoo3+a
	 IpvvErAmboTCaILC+cPyIaXiPcXL/M4XU65+Ft3gFX8WcGd7hzBFPHpUDne8pKF7RStv+
	 cEekAjtYXH7P0T9udualO/ZAgaMwvc/40bEdofHxapu67u347Wr5DkmqkvgSYzGrKUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YdKX24K5;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D255606A326
	for <linux-clk@vger.kernel.org>; Sat, 24 Oct 2026 10:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D255606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YdKX24K5
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so9368205e9.1
        for <linux-clk@vger.kernel.org>; Sat, 24 Oct 2026 03:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792838052; x=1793442852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A5n4SrWvMlC2EiMhPFY7DM1ChkFypUIMEv8fI4m9dNU=;
        b=YdKX24K5TOlpcFJ0JFIKaPqeZd4jYWqUjIEwLJZQlXOYeeUNYiMecPrIjGLx4Z4fnx
         m7HvkLbn/xgQWV/9JK9FzWU81MbsnAt89fyh5SOPZcPW7LTgeEEex2KX6oFkYxrL87Gr
         5Fh6FS/GSOTMoj4WtGxvocaACDei6U2u6mXZaoqJ+zP9ZwJyg1YPYl2l/Xx8QAZMbIWc
         eafGUH0BG9+0f4o77CCKZS0eTQYVuIuC3270RWyV+W86puo4d2xYSl8OQe2QWUJ4ffom
         tkNmTSe6kHB09Dm23ZQmSm4Unn66KFGafc7CF93cE8MMb3By5rX8S+0REEDh0s95Uqyp
         bfXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792838052; x=1793442852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A5n4SrWvMlC2EiMhPFY7DM1ChkFypUIMEv8fI4m9dNU=;
        b=juqMCuzL9qm9qeBPxTP9066geVy4oN9wVgzqmZkqdKaRVfcOJgSFd73N/jUGvMF5JF
         OwyWKwsgq4DW97xb7ztO7RWw/kba1aB4CJi8cEeWXNVUzbz1/fngGxr/2JVFIPfdWo0n
         AR3w9aY9Or4XB7Do0sKIhvJuwg7oD3zZn285rAKCo9F4vlNN7JsYuSdvPEE6hWcP3HJl
         U3f5Rej3zK6nCXGA6JWHgNclKvpXzP5scv1w0Ass0O4I5uKxfDcMMFuROrRyPbpNraMF
         a4+qHQlLQKby4ARfhZpESfNGXW4/eVvCuWDTMMgSkFwOZwp5HY0//WYfM1cAgM+Ck0GW
         ECUw==
X-Forwarded-Encrypted: i=1; AKwUvBwwLMZW8VMUCv+O469Upj/VZn3AcdmUVlrmSWKLr385RNN8qI00dJplCm9Cw+BcIQOKM0zu+4VzV48=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXrIsqeD1Yyb2+V+6CAcGZUtVcuGk8xmGFmhM9wBGB86opSrY+
	qfveiaKWdgnAvdMEqlOM+NJyx5gk3KJzGse+t5KtQAfM0vfjADVkkhPq
X-Gm-Gg: AYBFou0uhOe+dt0efKTjZKK8mOW2nxKXAzUF36rfBALsjgJHc1bRthij2XQ8/IECx2A
	+k5n8qmIpkc6rUBNT0k/fUJ7hjjRPpqrwgJ1/I0x7vhgAhdVK5MMudwwze4Vk4QOSWrAgQeDiol
	HEtZuih8z5hp681lEO/G5XGtuBkpt6DNX0H1sVZqmmPCOc/YTflJRB6IL7gFYYzm0IuYAV3WEGV
	8lnxGSon7VQYRLdvUQTOmlghwDcYpFiBf16GwTP50O7gRGuun/9REndnQXUg5pV/GTEQ4+5KiYb
	jrHihchyemMzF9oL80rCGwYpuxUGP2LS1B3bZJbRZWZhKAwHTBCDq902f56IqmmtYVXGp1jNTT8
	m6o9D+Fsx/MwBpKzf5MXLGgLz+otdSBk1H5uG9vclHtijHRHVpllgVyO/XH2CVbbn+JZqhNlFwz
	uRoLMGHDUYgWqD8lCxdBkqHNWicxvrXXETzuGH6xOQaFhjj5jJjhEfyE2FA96jTXqFbfCC2/Vno
	3Q6cO7f72Idir9lZ3LYfWZUvAWfrVeLjOE6/SXCRph/3MPrMPdYw4Atni7G+gIKbD4rwP0xq3mN
	SXLhmPh9eA8WmZqhthPDbQLKBhiTdp8YKQDovrly6mLJ8X6/Ukt0QBkQmJtb4i1iobdiE0qhvJg
	7GUMvFag=
X-Received: by 2002:a05:600c:83c7:b0:4a1:e00b:a0ea with SMTP id 5b1f17b1804b1-4a35ac3f293mr26033995e9.1.1792838052522;
        Sat, 24 Oct 2026 03:34:12 -0700 (PDT)
Received: from threadripper-fedora-workstation (d-zg2-024.globalnet.hr. [213.149.37.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd35c2sm3544825f8f.39.2026.10.24.03.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 03:34:12 -0700 (PDT)
From: Robert Marko <robimarko@gmail.com>
To: andersson@kernel.org,
	abelvesa@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	taniya.das@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Robert Marko <robimarko@gmail.com>
Subject: [PATCH 2/2] arm64: dts: qcom: ipq8074: Add CMN PLL
Date: Sat, 24 Oct 2026 12:33:10 +0200
Message-ID: <20261024103401.761125-2-robimarko@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261024103401.761125-1-robimarko@gmail.com>
References: <20261024103401.761125-1-robimarko@gmail.com>
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

Add the CMN PLL node, it will be used to feed the required fixed clocks
to networking subsystem.

CMN PLL provides bias_pll_cc_clk and bias_pll_nss_noc_clk to GCC.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index 75a5ae30d966..8afc63a72144 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,gcc-ipq8074.h>
+#include <dt-bindings/clock/qcom,ipq8074-cmn-pll.h>
 
 / {
 	#address-cells = <2>;
@@ -15,6 +16,12 @@ / {
 	interrupt-parent = <&intc>;
 
 	clocks {
+		ref_48mhz_clk: ref-48mhz-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <48000000>;
+			#clock-cells = <0>;
+		};
+
 		sleep_clk: sleep_clk {
 			compatible = "fixed-clock";
 			clock-frequency = <32768>;
@@ -257,6 +264,18 @@ mdio: mdio@90000 {
 			status = "disabled";
 		};
 
+		cmn_pll: clock-controller@9b000 {
+			compatible = "qcom,ipq8074-cmn-pll";
+			reg = <0x0009b000 0x800>;
+			clocks = <&ref_48mhz_clk>,
+				 <&gcc GCC_CMN_12GPLL_AHB_CLK>,
+				 <&gcc GCC_CMN_12GPLL_SYS_CLK>;
+			clock-names = "ref", "ahb", "sys";
+			#clock-cells = <1>;
+			assigned-clocks = <&cmn_pll IPQ8074_CMN_PLL_CLK>;
+			assigned-clock-rates-u64 = /bits/ 64 <12000000000>;
+		};
+
 		qfprom: efuse@a4000 {
 			compatible = "qcom,ipq8074-qfprom", "qcom,qfprom";
 			reg = <0x000a4000 0x2000>;
@@ -369,11 +388,15 @@ gcc: clock-controller@1800000 {
 			clocks = <&xo>,
 				 <&sleep_clk>,
 				 <&pcie_qmp0>,
-				 <&pcie_qmp1>;
+				 <&pcie_qmp1>,
+				 <&cmn_pll IPQ8074_BIAS_PLL_CC_CLK>,
+				 <&cmn_pll IPQ8074_BIAS_PLL_NSS_NOC_CLK>;
 			clock-names = "xo",
 				      "sleep_clk",
 				      "pcie0_pipe",
-				      "pcie1_pipe";
+				      "pcie1_pipe",
+				      "bias_pll_cc_clk",
+				      "bias_pll_nss_noc_clk";
 			#clock-cells = <1>;
 			#power-domain-cells = <1>;
 			#reset-cells = <1>;
-- 
2.56.0

