Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=94.100.137.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794122609;
	b=pBTkyZYsjeeGiCaxdpUstTF5dbBi82NZN7VBdu0mOJr3E5mQgyJVz/FUJSWKY+hzSg7X
	 53CwfuPCL/BSEQSIfzDdqLUmir9CT8NoRnvkOoClZkAP5ZVzR5Wl2dQYWtSzcr6Iiq4iL
	 NtHvnd0LkZqUFutgq0sF8bTBq/Hw7+Uo/8SeWu+fAOWGyOFsqIns57ncIifJs1/VuPo/k
	 9gWij0aYxfg7gybr7pIf70+EY+kBbEM0iW75jM52EYNsHn/xky+ahdIvh6qpo3nGlnzwu
	 39yPNSVHVd5WbGfMjbJODtg5aGIcdQB2PnvG8Bb6kpApNe6Us298NdtQoUXzM0gNGSg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794122609;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-cloud-security-sender:
	 X-cloud-security-recipient:X-cloud-security-Mailarchiv:
	 X-cloud-security-Mailarchivtype:X-cloud-security-Virusscan:
	 X-cloud-security-disclaimer:X-cloud-security-connect:
	 X-cloud-security-Digest:X-cloud-security:DKIM-Signature;
	bh=Y+FQJ0zypw4oW+399fIPqM//JlpCiJSggbCdSifvem4=;
	b=Zi/DvnBFdTrO49MkBbrVGGWAJGtkk7qE+XO2cvAbjHgBTLmW5XLAZGNtLhmJqhHKwYOX
	 hJUnNjXs8QchLzj0w1+oCJLWYodz8q9MsyqqHh0ENEiU6/rlATd2leUKXlUaKSqWGVLSV
	 SS+GovEAOjzx4Gxl2JwN2IEyyThN+YFj5GReOV7qtYnCqJz9pjrXHUZPZ4XJrB0PwbTca
	 SXSpC2y7zEvfBLh03j/dBeaVNOuHi56tdqimsy9ArmmBRCIaryXwjjGArK/LZoQL1Ow+7
	 etuVeccE6rEC9kKLpklTBuTkijPi4Q1f5ZRxvhRFGbS9ZxpyZK0APF3AjhqFMUMGdCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=marcant.net;
	spf=pass smtp.mailfrom=marcant.net;
	dkim=pass header.d=marcant.net header.i=@marcant.net header.a=rsa-sha256 header.s=gandalf header.b=yJ0SooYI;
	dkim=pass header.d=marcant.net header.i=@marcant.net header.a=rsa-sha256 header.s=hse1 header.b=sAH1e11m;
	arc=fail smtp.remote-ip=94.100.137.46
Received: from mx-relay36-hz2-if1.hornetsecurity.com (mx-relay36-hz2-if1.hornetsecurity.com [94.100.137.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A098C606A322
	for <linux-clk@vger.kernel.org>; Sun,  8 Nov 2026 07:23:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A098C606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=marcant.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marcant.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=marcant.net header.i=@marcant.net header.a=rsa-sha256 header.s=gandalf header.b=yJ0SooYI;
	dkim=pass (2048-bit key, unprotected) header.d=marcant.net header.i=@marcant.net header.a=rsa-sha256 header.s=hse1 header.b=sAH1e11m
ARC-Authentication-Results: i=1; mx-gate36-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=217.14.160.69, headerfrom=marcant.net)
 smtp.mailfrom=marcant.net smtp.helo=rossini.marcant.net; dkim=pass
 header.d=marcant.net header.s=gandalf header.a=rsa-sha256; dmarc=pass
 header.from=marcant.net orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=Y+FQJ0zypw4oW+399fIPqM//JlpCiJSggbCdSifvem4=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version; i=1; s=hse1;
 t=1794122595;
 b=GOcGXbzLvo7HjgQMH5UqjdVOhA6vZHOgf2RGbZGTmNI84iMDKxKyXZQ/2qAUpyhleMfz+0bU
 L76CDUhbqBqUzuMfKski9Y4eOEj7BzFtcLU5AxaKp4f8HGqOJ60YW4KgT9iidbKzQiPJExkNOBE
 YJF8u96fscwp0kCoFSN9AIEsNN38mNw/oGVbXPWRMOw2wbAnA/T4J1HxRbOeImOGUHHG7/H4hC1
 HdmIYLUGdLHY2kbTCwQDXNEbqo3PkWoPowullKm5NwMC/BUv2tEmDczR+W+fIhu6dxB+aHRu4yC
 zErUFyGtmHO/i5IWEhTV5fsIXLGz8cqjuRdG0B2+WWRBg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1794122595;
 b=IH14qN+6+iZm60FIhOMzZYuACvfw1ND9VqpwMr5yey6sI9qFw+xlgdrCJDmLoWl2K3Zb+WKq
 UKyoM6JcC2ewV3rx5KM/V2O+4wPz4BxDObvpOzE1rujHd8MXKMXGp5BwHgt7gTe+lU/FdDecN7B
 v1EXHcokEyBsgRLCmSe5Hd8i6YVfLAk7RObz3hXIMKv39Mo2hHHFiqzFaDZcVvZxaomUJSs/oNV
 Xmm9MtQCWxTnBiyCllJvbZxZ2KPkjCJ690jUDmg2ipijeAbfyz6ApojMkOUj6Ld/Yn0hO5/n9VD
 bDmT1vxQ/NMKi/aSW1BdBoYAdWwgWBFK/VfQVxq0+Nj4g==
Received: from rossini.marcant.net ([217.14.160.69]) by mx-gate36-hz2;
 Sun, 08 Nov 2026 08:23:15 +0100
Received: from futile.kalnet.hooya.de (unknown [192.168.203.16])
	by rossini.marcant.net (Postfix) with ESMTP id E351A9618A5;
	Sun,  8 Nov 2026 08:23:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marcant.net;
	s=gandalf; t=1794122583;
	bh=Y+FQJ0zypw4oW+399fIPqM//JlpCiJSggbCdSifvem4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=yJ0SooYIuLAkuiUdxHJSCvS6WIAQGjIVUDxUEZaHY14sD4E29IFSN/9CTzW1amRSb
	 7y1CB6g3/O9BeNqsgjOWySA6/Q8RKWfQg1dRgB0LRFZBTTOCz+6vCYmwfnyMtRMsiw
	 zCtT4RyZyWa9Dzoj/VrPv97Uxp4NHKG3uMQnI2YE=
From: =?UTF-8?q?Andr=C3=A9=20Valentin?= <avalentin@marcant.net>
To: Bjorn Andersson <andersson@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Julius Bairaktaris <julius@bairaktaris.de>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Andr=C3=A9=20Valentin?= <avalentin@marcant.net>
Subject: [PATCH 1/2] clk: qcom: gcc-ipq6018: keep port 5 on uniphy1 at SGMII rates
Date: Sun,  8 Nov 2026 08:23:01 +0100
Message-ID: <20261108072302.2311227-2-avalentin@marcant.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261108072302.2311227-1-avalentin@marcant.net>
References: <20261108072302.2311227-1-avalentin@marcant.net>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:avalentin@marcant.net
X-cloud-security-recipient:linux-clk@vger.kernel.org
X-cloud-security-Mailarchiv: E-Mail archived for: avalentin@marcant.net
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate36-hz2 with 4jMksM2TmYz1S50Q
X-cloud-security-connect: rossini.marcant.net[217.14.160.69], TLS=1, IP=217.14.160.69
X-cloud-security-Digest:70b48bb3e2da5c3c2062b1e9f6970276
X-cloud-security:scantime:1.567
DKIM-Signature: a=rsa-sha256;
 bh=Y+FQJ0zypw4oW+399fIPqM//JlpCiJSggbCdSifvem4=; c=relaxed/relaxed;
 d=marcant.net; h=content-type:mime-version:subject:from:to:message-id:date;
 s=hse1; t=1794122594; v=1;
 b=sAH1e11mpw5QCMtxr+Gll2uH91UIFRpwgQWPj/kf/HlGjA5WMJYV485EKDVBsVvUhdmcyiFV
 t3OvGOaV9A1ezq9WUSza3MMA5E4swp0Y/Ex+Qnw7JmI9qN8H20zs12eX+i289FbCu7brbSezyPv
 U431oE9IgjJYskDqPIExXgKFMGR4G5mNx60cIGgApndzC8nrDrhYhVQGu08UXVzmLOBivV2E8CA
 N888etxXI1IQxLyg6vp8UBZw9EEz73dneIywznrUu9c8dhC5OGmfzLEYizdAY4M4OMA9Py+B3NO
 N/+5+5KcnhPvFWQYu3w3AuPdWE9UhPKEwD8eCkfd2hXqQ==

Port 5 can be clocked from uniphy1, which runs at 312.5 MHz with the
PHY in 2500BASE-X and at 125 MHz in SGMII. The port 5 RX and TX
frequency tables serve uniphy1 only at 312.5 MHz: 125 MHz lists
uniphy1 / 2.5 and then uniphy0 / 1, 25 MHz lists uniphy1 / 12.5 and
then uniphy0 / 5. __clk_rcg2_select_conf() takes the first config that
gives the rate exactly, so once uniphy1 runs at 125 MHz, a 1G or 100M
rate that reaches the RCG moves the port onto uniphy0 whenever uniphy0
runs at 125 MHz, and otherwise leaves it on uniphy1 at 50 MHz (1G) or
10 MHz (100M).

Add uniphy1 / 1 to the 125 MHz configs and uniphy1 / 5 to the 25 MHz
configs. They go after the existing uniphy1 entries, which serve uniphy1
at 312.5 MHz, so that 2500BASE-X keeps its divider, and before uniphy0.

gcc-ipq8074 does the same for port 6, whose tables list uniphy2 / 1 and
uniphy2 / 5.

Suggested-by: Julius Bairaktaris <julius@bairaktaris.de>
Signed-off-by: André Valentin <avalentin@marcant.net>
---
 drivers/clk/qcom/gcc-ipq6018.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/gcc-ipq6018.c b/drivers/clk/qcom/gcc-ipq6018.c
index 6943dc51153..a86b52e4276 100644
--- a/drivers/clk/qcom/gcc-ipq6018.c
+++ b/drivers/clk/qcom/gcc-ipq6018.c
@@ -513,11 +513,13 @@ static struct clk_rcg2 apss_ahb_clk_src = {
 
 static const struct freq_conf ftbl_nss_port5_rx_clk_src_25[] = {
 	C(P_UNIPHY1_RX, 12.5, 0, 0),
+	C(P_UNIPHY1_RX, 5, 0, 0),
 	C(P_UNIPHY0_RX, 5, 0, 0),
 };
 
 static const struct freq_conf ftbl_nss_port5_rx_clk_src_125[] = {
 	C(P_UNIPHY1_RX, 2.5, 0, 0),
+	C(P_UNIPHY1_RX, 1, 0, 0),
 	C(P_UNIPHY0_RX, 1, 0, 0),
 };
 
@@ -568,11 +570,13 @@ static struct clk_rcg2 nss_port5_rx_clk_src = {
 
 static const struct freq_conf ftbl_nss_port5_tx_clk_src_25[] = {
 	C(P_UNIPHY1_TX, 12.5, 0, 0),
+	C(P_UNIPHY1_TX, 5, 0, 0),
 	C(P_UNIPHY0_TX, 5, 0, 0),
 };
 
 static const struct freq_conf ftbl_nss_port5_tx_clk_src_125[] = {
 	C(P_UNIPHY1_TX, 2.5, 0, 0),
+	C(P_UNIPHY1_TX, 1, 0, 0),
 	C(P_UNIPHY0_TX, 1, 0, 0),
 };
 
-- 
2.47.3

