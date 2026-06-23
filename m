Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236093C7E18
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 07:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782200092; cv=none; b=S6F0h4oCXUbH6d1Vch0jTLzqjxPm/bJIfjanm/XIYgmBxzPn1XZLeVUkcI66CMKAEW4o46HuypOvyLJ3GlHwkes27XV/l6ePPuqeM5xTB+OtEt4Vxu/Zs2P0DTz4IIj9KmGDWfOzvT5BZnr1RMOk0rCXCf60NUq2Nk3nseaUldA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782200092; c=relaxed/simple;
	bh=zMZ130vCFWl7DqmQl6TnnSI/sV8pYfA5UZbrwJxA4ic=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QbAHAPnVB9uXeng8EG0f4FZh73Z3Fq4o660GKoHicYBJibVjlxCJQhSRg+FHI/xicFpmgR2ql88m2Z5p1IcPi74f98W1bbmfvthPNxXUtwkZ8uOr56Bf95eg5Mm2PzIQNozvbItk1DY2ls067zmCl/0cVrxBOFq0uMtIt1LzIuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PYyw3NBy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WbVhwiii; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PYyw3NBy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WbVhwiii"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N6cXU63338344
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 07:34:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=JbRww8nPhhpxtS+7cOKXGbLWj7BLD9Ao7/a
	LGJ/o9YU=; b=PYyw3NByQWyZwd0YO6UP2kkGoVrWpbd9yBLS3FhefteT0KFU/2Z
	gyq627wIc+pquwPTq9y/RG+7r0KGZbptOebUFdcscupODAcQjQ2Sp0qZnIBXwL9h
	HHTx3KYYzaBtunEmxdF3C9PGTdcCybT3jI9sQOz2jiiiE/vSn3wr2pCcPVAbQTCO
	nDzUX/CVuyMl9V4xJk7nX8sFk8vS3JMOlCcUNOmlGB9u3pbu/C8vdZMIsyI+/rSC
	/TcVjZ8nHAyzJKMYLoaxwZGyRADEojspq54qaxTwG+712eyCsiv17DQUq+Lz+GFv
	ipcySYJtofGxvj+PhmUnNP+3TkEZlnbVyOw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eygkjh48c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 07:34:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9159c4b210aso137598285a.1
        for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 00:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782200081; x=1782804881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JbRww8nPhhpxtS+7cOKXGbLWj7BLD9Ao7/aLGJ/o9YU=;
        b=WbVhwiiiwKp+nuiLJH/L0C6novY3C4ty3yeRTdzyXFQzUpgJmg00TF6pJ1b9qlt1HD
         V6IuxKaXS3klFvxWQrh0jK8q8uTSeaNTCKI6ppv9sndMD+u7Vmexbk2+Bq/yZABSOaBW
         X/swv5attGHUzWfwlelyuY6Q/vtt7lbw7GRHY1etuWQafAUiWoXEtGtXvVXBX0qM7jvV
         JPpNq8qcyO93EbPrdwwCYF65x70rfLLvX0VCPJa2io1EOKG41VAtz69QkH0cGriBpuz+
         xB2QQ4KPM5QFo17Q+BLcJOetjmhQ6gB0jBbbIzjNoNGnGzIPy30Or9jsEGFKCnme3sMg
         YYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782200081; x=1782804881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JbRww8nPhhpxtS+7cOKXGbLWj7BLD9Ao7/aLGJ/o9YU=;
        b=B5RatMVuW/+TomXMs6M9g5v/gncjLG3QnOCmNc8moAW7iY5WGBlvZR5Gd3+qQZBs4Q
         m7ePSzUi8slXpOjRaxkx/zJosF5jqah63AD7xhY0TNn+o0+gKS2WkoXSViRFa5qmrjYy
         LFG2P4ekEEzug/ZEnZFMDVdHUFXyl5f+7q+SDRoa8eDxW5OoBQjtIqDujxRQlPCIVCgi
         lLCwAfvwEkU5P48eu2tv6pPmoSanZSvS/ub7Y9eBqxg5C2YUEK4qjGJmbUfgzMhMcuog
         qbjDaF9R2bZIQv4CaSyfYGPLr8p7VsHwZa9ZAuBYxxOANlLBL0liRNF99/s99A0tjRlS
         88Dg==
X-Forwarded-Encrypted: i=1; AFNElJ9+hY1hjyPaYIpvG4JuxiiqHSmWwwIzeUiQZNkqjXnQ+OkqpbZDMmQmtYBEIL4EuNQBidhIJXVAilA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAU+5FzsSJrUqw54yc9j3oQpVy1kHKHWJn6bY/ugHO8ReuKgTr
	ZrUNgrb/Jv9XGVW1Eh0CgB1Is1+er+/m7ds7OmQ5JQd7sYP9QAHTd5PB9euDtXIUaqPNWDnDlyU
	XLVzuaFvOnRS/7DOazC2M8uJnSyCHxUzYihF/d/XVUCxAt7zRXqwrl/9f0AM/3Iw=
X-Gm-Gg: AfdE7cn4YLObfXbr1cqgEHAox3Pu911gZ44sdmBq1/rR9k2bhip3IHx7L2NAEzyXsR4
	rjFd32SVlVQ8nPAbdeF8kDBdV10l//xQGPd9PXJC8tADjGQIt92movU3eDw/R65pyrN5RSpoyGZ
	InF0k4n8ATrJMzj5CUr/A3iK2SXpzcIYc/hwPPxUSRhnbQhMS8kaUYcy9O1umoZi+HMoHt5RmTh
	ZybmQilg8SWO5aFceZkMwqmcIqrBKiG3lksjVPRGqdCq1E1ZWkoR5hNruk+J+MCclLBlmtuOLQt
	Tx6ckE5sgFUbr8f+a8Bq7RdYv2Xw6GeRGn8nzb/7Vrw1vTkz7ED8MFJLS7k8SaeeWNkScNhktNz
	fu8CwfJiGZLHbiztfoRsFJ9Sg6YA=
X-Received: by 2002:a05:620a:4613:b0:915:aa65:6e95 with SMTP id af79cd13be357-926039b55aamr440150385a.44.1782200080997;
        Tue, 23 Jun 2026 00:34:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4613:b0:915:aa65:6e95 with SMTP id af79cd13be357-926039b55aamr440148085a.44.1782200080513;
        Tue, 23 Jun 2026 00:34:40 -0700 (PDT)
Received: from quoll ([178.197.218.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466643f4e3esm31621828f8f.8.2026.06.23.00.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 00:34:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luo Jie <jie.luo@oss.qualcomm.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH net] net: ethernet: qualcomm: ppe: Demote from supported and fix maintainer addresses
Date: Tue, 23 Jun 2026 09:33:08 +0200
Message-ID: <20260623073307.36483-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4322; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=zMZ130vCFWl7DqmQl6TnnSI/sV8pYfA5UZbrwJxA4ic=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqOjazy+CGgsFoC5bradNDUIXivrQCA/T2/GdGW
 MRx1arzdJeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCajo2swAKCRDBN2bmhouD
 14WtD/44vRc4VEabogwLpOCsUUaqaJM+sLsM2L0gYyC2whu75RUVBzqqW+HM1X3QE9RstfwvD4j
 UY3DGbOAgfO5U/SVSZIhTUZkmZeIM2V4UD7zbCmBT5lg9WC/FrvUMjE/K7EFY7ax06aapyjPTmU
 bGSCtHrsvOQ2jJ2/j8bWPU+rV+BeQdy1DXXRX/Yq4+OPJdEEmRzVpNdFF/c8Nj9EoubVSfAie/3
 qEBIT8cUqvfQQdE03eC7gd2P4EhYnKXCcYffZ1jCgIEaYAemPxlKn2tYaOE2debWs81WxHI10/A
 6mfC8ezxoCmwuZl0saQLihlRxJqNZKu6OXtnON0mlYcSwzCWtX++PN9YtRwWBf6Z1UwrlD1DGaj
 M0gxeeGvT6akpvq+RnQhLraKQiifbpEse4hWdYRV9ePxFbbECp3/k/EXC4Yq07X+6ufNkOgupDQ
 3ebgZDvDXvCUvMnb8F93VUWnsuScr6hCTuMbvOyCqOXqO0iZjvWpajEurc3JhCdQBiLJ7uOGaby
 GajzsKwWfQpor683BocSqycNSj0Y6lN+IeEcF8M7qloE0vUWrLtgCJVzz+cEhkdOu7a6ePiIeXg
 KxpH90opId7Qmtbug+6wjw8uJYOl8Gz5FANvs/XLVRcCvOvwT3Mkot1arUmngQQMpnVz7v1ExFc Irx0cICn6yzOhlg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA1OSBTYWx0ZWRfX0/D6vds5A4VR
 wCPZdMQXcfR7wUnclAuZNFiW1dO4UxrK9lq6K6JNzAtjAp3XsfKgHhJqj6KgcAXX8FVdRs4WLdA
 oTp3Wteke2cwuy4GvC285DDNQp3hQ+BIctT3utaVh61z0bp0hFKfYc2169052e/1xt9QE01HWwW
 AOOaN5yRZwj62dWp0d/G9jDsKjp5dj0XJk1+Llews+ceMRoiB5p8ExQTwoDq4fwiFGziR9CKf3v
 V38IcRnSCXGqdYueP53ZxZ5BgPI88XWMpYi5t9qHtyncBZZecBS2wIS8Vn5s8/kXgCEArP1aDUy
 aOdbiFRkXX84ksbjnqzaynGRlTqCy1NsE92de5Xs35/sIXQq7N8+sXd7OI33EHhSs0/JlKZ3sNj
 SNMdnHDEvp8HReWQN1gOWkExGwzpfvvZAamMNrW5dnU90xplLOOtZTfJhBWtQXL9AvJ6v+LaXli
 /L0znWCAf+1m1RewE4w==
X-Proofpoint-GUID: Sic4T2mqUX12W2Ep42rxphXXxNSwSmTn
X-Authority-Analysis: v=2.4 cv=SoKgLvO0 c=1 sm=1 tr=0 ts=6a3a3711 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=qMZSjPy+XpteAuilWfML4g==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=gEfo2CItAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=P-IC7800AAAA:8 a=6yzhs6WGAAAA:8
 a=dlmhaOwlAAAA:8 a=40pjNWuwAAAA:8 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=7CQSdrXTAAAA:8 a=hD80L64hAAAA:8 a=LpQP-O61AAAA:8 a=pGLkceISAAAA:8
 a=9xbOYk6fAAAA:8 a=gPJu0pBYAAAA:8 a=r_1tXGB3AAAA:8 a=yRDnTAKIR_WafuKkSVIA:9
 a=NFOGd7dJGGMPyQGDc5-O:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=j5F3_G_i7ziBYwdlbqZG:22 a=y4cfut4LVr_MrANMpYTh:22
 a=coQwfJANHVg1YNGTr4By:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=pioyyrs4ZptJ924tMmac:22
 a=qQLkZBVM-NGEvsx9vKov:22 a=AlIIF0cMT2hfDT4axODj:22 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA1OSBTYWx0ZWRfX9eLvyJL/Za6n
 E8yJhBM6DJ+TVnn04h2ZXyzTM5WmT5g+WoXASGFJxVw94/0JBmolPM7No9SpfoGHx9f2Xheqjip
 /6KnY4Q+3DHjf9oCvWocwYjQ60Rc2Bg=
X-Proofpoint-ORIG-GUID: Sic4T2mqUX12W2Ep42rxphXXxNSwSmTn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230059

Emails to the maintainer of Qualcomm PPE Ethernet driver (Luo Jie
<quic_luoj@quicinc.com>) bounce permanently (full mailbox), because the
"quicinc.com" addresses were deprecated for public work.  All Qualcomm
contributors are aware of that and were asked to fix their addresses.

Driver is not supported - in terms of how netdev understands supported
commitment - if maintainer does not care to receive the patches for its
code, so demote it to "maintained" to reflect true status.

Fix all occurences of Luo Jie email address to preferred and working
domain.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .mailmap                                                      | 3 ++-
 .../devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml       | 2 +-
 Documentation/devicetree/bindings/clock/qcom,qca8k-nsscc.yaml | 2 +-
 Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml   | 2 +-
 MAINTAINERS                                                   | 4 ++--
 5 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/.mailmap b/.mailmap
index 1f23ea6e8ce1..23eb9a4b04f4 100644
--- a/.mailmap
+++ b/.mailmap
@@ -530,7 +530,8 @@ Luca Ceresoli <luca.ceresoli@bootlin.com> <luca@lucaceresoli.net>
 Luca Weiss <luca@lucaweiss.eu> <luca@z3ntu.xyz>
 Lucas De Marchi <demarchi@kernel.org> <lucas.demarchi@intel.com>
 Lukasz Luba <lukasz.luba@arm.com> <l.luba@partner.samsung.com>
-Luo Jie <quic_luoj@quicinc.com> <luoj@codeaurora.org>
+Luo Jie <jie.luo@oss.qualcomm.com> <luoj@codeaurora.org>
+Luo Jie <jie.luo@oss.qualcomm.com> <quic_luoj@quicinc.com>
 Lance Yang <lance.yang@linux.dev> <ioworker0@gmail.com>
 Lance Yang <lance.yang@linux.dev> <mingzhe.yang@ly.com>
 Maciej W. Rozycki <macro@mips.com> <macro@imgtec.com>
diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
index b9c3650e5c4c..a4f9af8fa187 100644
--- a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
@@ -8,7 +8,7 @@ title: Qualcomm CMN PLL Clock Controller on IPQ SoC
 
 maintainers:
   - Bjorn Andersson <andersson@kernel.org>
-  - Luo Jie <quic_luoj@quicinc.com>
+  - Luo Jie <jie.luo@oss.qualcomm.com>
 
 description:
   The CMN (or common) PLL clock controller expects a reference
diff --git a/Documentation/devicetree/bindings/clock/qcom,qca8k-nsscc.yaml b/Documentation/devicetree/bindings/clock/qcom,qca8k-nsscc.yaml
index 3da10c364a85..8d7a58609372 100644
--- a/Documentation/devicetree/bindings/clock/qcom,qca8k-nsscc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,qca8k-nsscc.yaml
@@ -8,7 +8,7 @@ title: Qualcomm NSS Clock & Reset Controller on QCA8386/QCA8084
 
 maintainers:
   - Bjorn Andersson <andersson@kernel.org>
-  - Luo Jie <quic_luoj@quicinc.com>
+  - Luo Jie <jie.luo@oss.qualcomm.com>
 
 description: |
   Qualcomm NSS clock control module provides the clocks and resets
diff --git a/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml b/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
index 753f370b7605..6d0b21a10732 100644
--- a/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Qualcomm IPQ packet process engine (PPE)
 
 maintainers:
-  - Luo Jie <quic_luoj@quicinc.com>
+  - Luo Jie <jie.luo@oss.qualcomm.com>
   - Lei Wei <quic_leiwei@quicinc.com>
   - Suruchi Agarwal <quic_suruchia@quicinc.com>
   - Pavithra R <quic_pavir@quicinc.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index 895a87b571c3..e173828acfe1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22324,9 +22324,9 @@ F:	Documentation/devicetree/bindings/power/supply/qcom,pmi8998-charger.yaml
 F:	drivers/power/supply/qcom_smbx.c
 
 QUALCOMM PPE DRIVER
-M:	Luo Jie <quic_luoj@quicinc.com>
+M:	Luo Jie <jie.luo@oss.qualcomm.com>
 L:	netdev@vger.kernel.org
-S:	Supported
+S:	Maintained
 F:	Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
 F:	Documentation/networking/device_drivers/ethernet/qualcomm/ppe/ppe.rst
 F:	drivers/net/ethernet/qualcomm/ppe/
-- 
2.53.0

