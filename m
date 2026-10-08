Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FBF3D6498
	for <linux-clk@vger.kernel.org>; Thu,  8 Oct 2026 08:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791447077; cv=none; b=CUEZMUR98/+jKtVveUissL1p7/0j2pTx+bU//R6zaa8Blx0BANSxap2v65w2KDUvkNDYjvnyahGFT+DkPw3HgO1hTeVsVpE8VKHgBICxsfMpTeNbMLzKrujIDS66oDyTiwvqDd1gS3B4LiRlYF6WTSDLgf1fOcJLpLe+lmuSdug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791447077; c=relaxed/simple;
	bh=KLSCJNqWTfQH3hCgEppY4XAKXGuCvDCp1TPzxwkMcv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eATpPwNoqDw55HlvUmT9PoLu/x0B6B/Ob5zP+CpQMciYAEgD79OeSWuAntnb4R36Q0UAsZQZJosgg944NSZo34nT26y4GtKlCrlkQdruWhEHghBfiUDB6qgREWFv7MRoamcCxs8tdO+E3rhPqDvUtI99kWARRvmVfRThStWQhiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kBbLNoTk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DFntsM90; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kBbLNoTk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DFntsM90"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KAsF2560118
	for <linux-clk@vger.kernel.org>; Thu, 8 Oct 2026 08:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+YSuDvOoF29
	231NTS5Y9qMD1wu3gOUz6rCSgcpTgpGg=; b=kBbLNoTkninLLPGDlqi3hsZIptQ
	a/40r68KnX6acR0fd66zyls/hkS2Z7hYP6kaobnupT9oVAqstkTfCsIVzqZKkxim
	XMiyI2MnHNbmRhvGqwQxkgkOs94yGeP3ZxiWbqZ0vgWXuk5jXsG282myZ8tAdyzN
	sUfaA5bOfOw19E0+Rc/xOjKtO3bbS/BL0XMfoRI90MeAQXSaW8sa4evSiHI5G7mK
	FbUsQRt29eAUoJu7VyXdczJTj8x9ouvRbqzVvTafdcH2w/ilOTVziQqhUv5pWlEp
	RgBBEHEsY+83dZ90QS9JNyPBCzkqRiqmVqeqirO8ek64w9KA+aVAaXCT3Ow==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe81tex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 08 Oct 2026 08:11:15 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-147be78cd56so18059148c88.1
        for <linux-clk@vger.kernel.org>; Thu, 08 Oct 2026 01:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791447074; x=1792051874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+YSuDvOoF29231NTS5Y9qMD1wu3gOUz6rCSgcpTgpGg=;
        b=DFntsM90gzLfHlfqVYPF73BoRHH6ehRGRoSHoIuhXoQ9BqycPa2ra4+rNpAIVuyW6g
         0aDM7XtQg9AfUCvdthqHLpZigjPhEAmQvV9R/cJNK5AYGZEE9VT21YP1s4cZvUkJNI8p
         QFM7hjZ5bOA0DBrrmeO0Wkct9a+iL6Z4vTIH+qyoDvuTkxo5d/RMJpIjyYitnyarPjcC
         mGf3ht9jRS5vgyZe20FIH2HPa0DJfZxnNAQJtH+lKxY8blW5OIS3FJJdCbkV+tcD4cm0
         TtdLtvNbyNk/2inTClojzrQoP5H/qkP0aJZ8GsDGiH6WQiB/3zw5CmNA6anMAfkLX7O8
         /ZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791447074; x=1792051874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+YSuDvOoF29231NTS5Y9qMD1wu3gOUz6rCSgcpTgpGg=;
        b=SpE6T/0dDzGDZnF09CxHSyi+So38jkfmOiB9ksqpAgbfytaJPSyFHpY6TdFHXj25qV
         Wl4D1xmMyV2Rjie2XDZlE+NvDeXVNE3VWrGTAWkHeyA7dskIYHofDXK9iqI7cCdbhaxg
         a4FxZr9ItrTarRu+bT3KVXw0dBMfO55VDZSATVP2umkL2EC3noOTAoBFTcsXhd9erBtI
         6A7L0xziMEwKLobXqor4LbqL2mKqi1PbGyZ8By3N2XJcB0xWQg3tU6XPv/U1buLa2zKF
         kiJV1NTSgzu+oevWB/eUTcvjlV9gxNIgQIQMBnq3dw57IcWtBiYNUWe1+6UnYHhHD1AD
         og1A==
X-Forwarded-Encrypted: i=1; AKwUvByjlMKS5+Q7H1puSH44kYEHyEBtJdD8MgJ4f78VmQFVwy4XFGGiJCj7Z8iZuS3+wnVvP4+x2ovwUR0=@vger.kernel.org
X-Gm-Message-State: AFuF++nt9mi4ckqbKc1+ueYpJDnpAW9Bw57lu5HaakhGg8HSUoOIOh43
	6hrlTOSic4Q4W7Z0LMSZAaKY0mWUkzzya75tb2iDKOJ7WkaJXW3oev1ZeWgPggw7hacTDhoXkn3
	OHMwnwMDjZ9+1IvmVvY4Lv/Ed1v8PePZNSUbUgH/kA55aNLvGaJaJPeUjtabr98o=
X-Gm-Gg: AYBFou1uHCen3TONg7Uk3FfV1UYF1rFBLN6z04ygFjK2rrtRw5Qk7QGriksHeJLWkpK
	6YKTbC1PGXKo5F2seF8BXHbLLonr0ZzqrVroETYXBbFy8Zd8mKmnT28eVcdXzt9glrjHiAU3LEB
	eNW1NMvRNRWRH5+xlBc75xETRuJgRzLD7zWGVMYFWU5n6CVBz3JqQeedTqfKQxwCLAoDUnMZor9
	+dF8WIb7si0vvkC7jzytRLydSbcKMbBnAEVGWiGjYuBuJO2sQAm1Avq7VZ7dlsENXcnnwBa6Ac4
	tgHfiPiEQapbspxzOYgfrSmcOS0Qa6XFuJtE9RLdBM5REDwPF+vB2Ed/wq2AX7jNL/niWU/MN7c
	9oPUyalUM82pew3CXpyJbylS2hB1EBaRUzUi9Z5kMJKT2FZRnk2vUdlTIi2k=
X-Received: by 2002:a05:701b:4354:b0:160:8d8e:7e3b with SMTP id a92af1059eb24-162047a18efmr6279150c88.10.1791447074147;
        Thu, 08 Oct 2026 01:11:14 -0700 (PDT)
X-Received: by 2002:a05:701b:4354:b0:160:8d8e:7e3b with SMTP id a92af1059eb24-162047a18efmr6279101c88.10.1791447073475;
        Thu, 08 Oct 2026 01:11:13 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16166121f2asm14522277c88.4.2026.10.08.01.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 01:11:13 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 4/4] arm64: dts: qcom: nord: Fix videocc clock inputs
Date: Thu,  8 Oct 2026 16:10:36 +0800
Message-ID: <20261008081036.3492003-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008081036.3492003-1-shengchao.guo@oss.qualcomm.com>
References: <20261008081036.3492003-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzMiBTYWx0ZWRfX3OWGdqnoZ6bp
 azbmMMqABkdbfhAnL6hWVvIZa3JkvMEbh1a0oDIUVWJz439sZdVXHsdCNeheDlYe8aEev0nGarF
 a7Czc80PlFgJnmvwfL1itEfULnIOfQwkycsIpgAJ8ch50kER2ZJdFQnRBZvpLbl77c1O8c9CvBT
 Q5lz87h75h+M1+diaeprVYgZJSqZ9ENSTERD0YtWk+FRcu+/y1iberRQiKT2/VSjBMywTh7bmI6
 BLQxlR55HnAFy6qCyn9g3mRp5X8Jk8+4KchgX/V0V6fa8CXJLvw25udqWRrIJdaZSNd+9KbI32l
 l/TUrdCFthxv1TCbmwlXuTJ6J94YqSptE+xPEgJ2mt432NrTxbDO97mk6BnGTzJONOpqvXoXl2q
 baVASoO0FRa6iQGHNvLvBwdvleWQBzTHd+6THUELBLqkflaPptf6HvxWCkplQ3f+/c01NNZpx7+
 C2uqLVwHUFap+C+8ceA==
X-Proofpoint-GUID: MnrUrFMj1gsLrlbdkC_tIV2C9l6cP9vu
X-Proofpoint-ORIG-GUID: MnrUrFMj1gsLrlbdkC_tIV2C9l6cP9vu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzMiBTYWx0ZWRfXxpsFnLW/WpfR
 CVIKe9hbOuL/KOka7pESm4LVEQDtBVKfi+CuhRmkbLrSKu+Pt+aDWap9XHKSqq4CV5MQuisat6a
 U9T5yetOXdftCnQDB6S7Szmh3ZMK8vk=
X-Authority-Analysis: v=2.4 cv=MPT1C8Zl c=1 sm=1 tr=0 ts=6ac75023 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=I6E1kIfsyqVcGmBSIt8A:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080032

The video clock controller binding describes three clock inputs for
Nord: the board XO, the always-on board XO and the 32 kHz sleep clock.
The videocc node instead passes the board XO and NW_GCC_VIDEO_AHB_CLK,
which is not an input of the controller.

Pass bi_tcxo_ao_div2 and the board sleep clock in place of the AHB
clock. No functional change, NW_GCC_VIDEO_AHB_CLK is kept always on by
the NW GCC driver.

Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 1ab7d9bc3cfe..62d14be55839 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -886,7 +886,8 @@ videocc: clock-controller@aaf0000 {
 		compatible = "qcom,nord-videocc";
 		reg = <0x0 0x0aaf0000 0x0 0x10000>;
 		clocks = <&bi_tcxo_div2>,
-			 <&nwgcc NW_GCC_VIDEO_AHB_CLK>;
+			 <&bi_tcxo_ao_div2>,
+			 <&sleep_clk>;
 		power-domains = <&rpmhpd RPMHPD_MMCX>,
 				<&rpmhpd RPMHPD_MXC>;
 		required-opps = <&rpmhpd_opp_low_svs>,
-- 
2.43.0

