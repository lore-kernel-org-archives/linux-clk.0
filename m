Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795527032;
	b=j/whrCV9zipb/P0og7i2o8z+uqofkJ/wO6+/DsCCxfS3lil5ZUrQ10kPxiEyCMc1Pm4I
	 yxxqflUPPVhiqUc0mo1BqDmm+VW/In07kyRoVL0/PgJ9loGFdVSdjJILOjTY0FcgWUjRH
	 1sG3DOT1xzq/MPl74/XKQnlkjqbmHtYrRbWqtyXfpAzH46yLqD1SoC3WhqozOVaMHzmmP
	 /qCzBBuEX2qCZsoyFjqEp0K2vuru81zvDAXH3cl5qb4soQEefJqS6eSWO3XFXrITZXat1
	 mFOZLDUtthKIMh1gdskx8Mmf/4TAzGSzqv/9yMMG2+mDyGyXw7bY3J3+o9cOMcHgD6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527032;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2MDJKms4uQ7F8h4InQhO6Bayy8m0EQuJjk1Sh52tLew=;
	b=mNAec73IQt7EvVTGSGr0dVM8ACFa9WOBzHwhQ49HBZ/KozyLK+vW+5F6dVz8fbwPR+aR
	 uGkveryI+RZFF535qHQ1CiOaDvabnoaYqPRAA+Kcy1hnsgHg2W9lDyH0zrYLc26QSp9bA
	 8WoMaiztHjq9TbUX7wJTPQ1k074WGjjSWPC0kdAVdVLm9O7sjmeAHI2L19xVPYruzT1R+
	 9F7A1SChjXwsjS7Bv8r9TBFXPAi0kYTu16ag2E62Zd9ORSrlyFnzvWci3Q5nRhw62GO/P
	 OVwlal3KdbWgXUZb2ft7+2H/vIohPRQRm3Nw565nwCBKZKMkB+fn1O6UhTvArsQV65Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WzTAe5rY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DCSxXV90;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB583606A322
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 13:30:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB583606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WzTAe5rY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DCSxXV90
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuLnJ3541827
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 13:30:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2MDJKms4uQ7F8h4InQhO6Bayy8m0EQuJjk1Sh52tLew=; b=WzTAe5rY+o/a3QvZ
	WR2lRkd4v2kLCFUnDjfNu7aoGb8xlCpqexzP6GuD7LrAxMroXer5TjtFQY9LxQyw
	MJJz4Foi/6Bh5s75vtHq0moeywN9IBFhW20etvZjc4H21jlMs4T5ZWOQXvs7TrFQ
	zrsQF06is3lwoxQfW5LZvzNwrYb50C7NtePUYMCltgradO0n0r5MeZJG+OAFYWgq
	7s0YyqFZIf1yqcFPmcvnpAj1fqcQsmHVlbMBrxD7UVZv78zkG7V9ePbmz345Y0yc
	wzi+0ArxzipHj+1Rm/6h4VkjK5ON771Iae2HBEd6shimRga8SPX9hJ38ajAUaru5
	0FbIbw==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rh9vw3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 13:30:30 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b4f1e4abedso12066627b3.1
        for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 05:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795527030; x=1796131830; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2MDJKms4uQ7F8h4InQhO6Bayy8m0EQuJjk1Sh52tLew=;
        b=DCSxXV90LN2Q5jNu7MvirfX8pk2VqibFTrJOP+M2LwWT/KEpFSG3CoA/o1AzbkR3pq
         ylEw8mTFWVZryeTRp1mA4ugwttZhlV0bG8vdy6wBWLw/it9mCikIeUWFrP7czPizghE2
         AWR+QuiwVwBZnjQSdhVeF4wEiM+Yd37nCwXuxOT5rgYMHEQaneJtt0m6Olporu6hcoG1
         2tZCMDWk2kvJ5jXoXmuUiZ9RtaDabGQ9PzhWDtD5i15HLkMDO9mQeYkwzR9+GXb1kG9Z
         Clr0IzLy0SWfi6cXRlvHeUPrsnNzVRX+FvSJje41CPpTW3puSjZUscv6i3CpaDccZ7bO
         stAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795527030; x=1796131830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2MDJKms4uQ7F8h4InQhO6Bayy8m0EQuJjk1Sh52tLew=;
        b=MZLthJK8Bd0haoMurCT16dJFcoWBOrKo9TCtY94F7tUDhwDKGbA+qzNDMltGqbPdln
         dM5gRnuh2tV1whKRTkwuvX2mYHnBlDzLtM0AiQXBQQNZJ7FdKY692oNUCw1u6rT7X19w
         GnlcdprXVPDybc34Z82AiW+6xDGCbzqyTUgeavOHsn8QKGlByHZPYphLi+J7Gft4xhZ4
         T4xqP4AMGFn9JjZxrtrTKcUdhcx+ER8aPZRuN3bh741s7pNP1DbC1jUpf+loch9zmiFW
         rtDOpIqciCErRsre/cFn3ztEdaA2+rsh46EZMxW7yUVfMh1KY7VYNnvsVQ5/vITKSLTg
         SLZw==
X-Forwarded-Encrypted: i=1; AL+hErFnuqskRbniQjqb8c23iYvt1qJDbAW4Kjb5trZVrExKqE8AJyCuTV1ctUsQRd/tOnClq1crFWo0+H8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XjSzSbHFAqJtqZLNg+rMkJ/Y785zjBmc3JrhKy36ObphVhu7R
	pEt4dDtxvsbNBFB5Fm3r+4AaG5wZIEUNtad4HgpOoOFDzFEQyMAEbB0Ih5aSypsZTBQ1CXUPHVk
	qFOg3i/HkGAwSHUkVzCUMM3vuhXMLiZzkV0eRt3i5pFGwjdmmR4TIQlMRxxwjZDo=
X-Gm-Gg: AZFdTZcwwJ2qGSbJTyYWR9KjEZULroyXGrbF4AC53ZMf4u1LTDRzE5KVSgfEmcttADR
	iBsP41gRrWzvhpYti2As2wu7sgTNOSjv8ecN/JdXDohqkEMvOYRbjCoRwInP2wX/MYfR99cygS/
	PsXSsyBwspEt7pw4cSaVleqHw+qMcdvu+ZzWMXbuHKYh4KFWeAV/Aatl8lEHA4zGrviTjQEdbtu
	YYcN0ni3DJMo8aNQixaBr2LUD+yJI8ILS8gUZgZ1ExhlwQF8LadOcFtzr03QZ0LNVDnDu3Wwl7m
	aWiwkjRexnsdVPwgEVdkc9nh09wRXOXi2bzqEt1SJ3TEF9lWUmHE5FcbvdVNf3fKckUtpBEaSCl
	KzXqYg0QNgdxBcwcwyErGa47hh4vbtAHSPp98iw9Q7ZU25VPQ+i2/I7mLYYkOGljmAxRF+ZZRJa
	vesN7t/NQ=
X-Received: by 2002:a05:690c:7685:b0:8b0:d837:3651 with SMTP id 00721157ae682-8b52045e009mr84274827b3.3.1795527029829;
        Tue, 24 Nov 2026 05:30:29 -0800 (PST)
X-Received: by 2002:a05:690c:7685:b0:8b0:d837:3651 with SMTP id 00721157ae682-8b52045e009mr84274587b3.3.1795527029119;
        Tue, 24 Nov 2026 05:30:29 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:a546:3db2:3be0:87d9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b1ed8b6a05sm11659080f8f.43.2026.11.24.05.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:30:28 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 14:30:17 +0100
Subject: [PATCH 2/3] clk: qcom: gcc-sc8280xp: Describe USB4 MISC resets
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-topic-8280_usb4_clks-v1-2-be083a711eb4@oss.qualcomm.com>
References: <20261124-topic-8280_usb4_clks-v1-0-be083a711eb4@oss.qualcomm.com>
In-Reply-To: <20261124-topic-8280_usb4_clks-v1-0-be083a711eb4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795527022; l=2367;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=8fWbwJETrdYQP4QvahlKW7F7rkpfKHiiGzJMHQXHEBU=;
 b=ddd5rlIy9nrJ0fhOSMX/ilVM7VIqJ8/x0No5eC1NsKPuUJDEfI+XfCi5Z2rUHYsvUAr2KRlYB
 x4vPnCcZNEZAV4H6dn4bFePUCgHnijVJVk5075Iyo0PL/I+bM55OUps
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Authority-Analysis: v=2.4 cv=BKkmP1QG c=1 sm=1 tr=0 ts=6b059176 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=-mZdvksY9ZPVgEcg4yUA:9 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1MiBTYWx0ZWRfX7DN1rxbsEa8v
 qnXSOCePN4NHNrL6jGPVLgBCYlarvk5MezjYCUFSqXKJmYcpreYFXZ499voOyWh9GjDWQxBpeys
 vQ5ny2hQEsmW62FNg+ugjITNM01H6nc=
X-Proofpoint-GUID: qQEuJUJ6Tm5z5-C04InLnsRl1jWv1FuR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1MiBTYWx0ZWRfX7WyHOvo9DR7/
 0UjMYDdMf1uavZ532XHLh71RccYueJ772Dsu17/FvoivQ8Quvh6Yz+doucwxjqM494trQIcIFEp
 UisZMtp7hRXLJG4UsqTFS3iWYZjqPzzMGzCIrWLjpFaN0+ZCI/r76EUyikNVNdKr54QzJ8HRxso
 dHk087DOxvKfWz0x4s3xN77ISZcFX2EJzDkyRhadszocdAPP98z+kh7kAsFHJ8pjCNSIbHs88LW
 rUzIKb0EpfRM9xkTLU9bkiL3ZBu5hbpJrigkL/KQMfSpQBZHRO4MXjUuyg5S5DcvoWcQMDLPwup
 ZJ0qRUrcu/ce6WBq+xzUEfwsVLwoIzNGMHKrYAYOn6f0Es1wQZulDM6bVZYRQqVkAW7hxPkYLzC
 GprPTIxd1SRFNNmos1MKCU2jFakOfOi2p+Fbhjf58KB4e4nmYriS3NZFa222lDKetHnjb+wMN0F
 6KDPm/8/ZRavSSD5ofw==
X-Proofpoint-ORIG-GUID: qQEuJUJ6Tm5z5-C04InLnsRl1jWv1FuR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240052

A number of the USB4-related resets were left undescribed. Plumb them
in.

Fixes: d65d005f9a6c ("clk: qcom: add sc8280xp GCC driver")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sc8280xp.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/clk/qcom/gcc-sc8280xp.c b/drivers/clk/qcom/gcc-sc8280xp.c
index 918c70648d5738c5779e3fdc20a7161f77fb7365..077dd28610dc7b2a43c358a99317435c42ded970 100644
--- a/drivers/clk/qcom/gcc-sc8280xp.c
+++ b/drivers/clk/qcom/gcc-sc8280xp.c
@@ -7434,10 +7434,30 @@ static const struct qcom_reset_map gcc_sc8280xp_resets[] = {
 	[GCC_USB4_1_BCR] = { 0xb8000 },
 	[GCC_USB4_1_DP_PHY_PRIM_BCR] = { 0xb9020 },
 	[GCC_USB4_1_DPPHY_AUX_BCR] = { 0xb9024 },
+	[GCC_USB4_1_MISC_USB4_SYS_BCR] = { .reg = 0xb80f8, .bit = 0 },
+	[GCC_USB4_1_MISC_RX_CLK_0_BCR] = { .reg = 0xb80f8, .bit = 1 },
+	[GCC_USB4_1_MISC_RX_CLK_1_BCR] = { .reg = 0xb80f8, .bit = 2 },
+	[GCC_USB4_1_MISC_USB_PIPE_BCR] = { .reg = 0xb80f8, .bit = 3 },
+	[GCC_USB4_1_MISC_PCIE_PIPE_BCR] = { .reg = 0xb80f8, .bit = 4 },
+	[GCC_USB4_1_MISC_TMU_BCR] = { .reg = 0xb80f8, .bit = 5 },
+	[GCC_USB4_1_MISC_SB_IF_BCR] = { .reg = 0xb80f8, .bit = 6 },
+	[GCC_USB4_1_MISC_HIA_MSTR_BCR] = { .reg = 0xb80f8, .bit = 7 },
+	[GCC_USB4_1_MISC_AHB_BCR] = { .reg = 0xb80f8, .bit = 8 },
+	[GCC_USB4_1_MISC_DP_MAX_PCLK_BCR] = { .reg = 0xb80f8, .bit = 9 },
 	[GCC_USB4_1_PHY_PRIM_BCR] = { 0xb9018 },
 	[GCC_USB4_BCR] = { 0x2a000 },
 	[GCC_USB4_DP_PHY_PRIM_BCR] = { 0x4a008 },
 	[GCC_USB4_DPPHY_AUX_BCR] = { 0x4a00c },
+	[GCC_USB4_MISC_USB4_SYS_BCR] = { .reg = 0x2a188, .bit = 0 },
+	[GCC_USB4_MISC_RX_CLK_0_BCR] = { .reg = 0x2a188, .bit = 1 },
+	[GCC_USB4_MISC_RX_CLK_1_BCR] = { .reg = 0x2a188, .bit = 2 },
+	[GCC_USB4_MISC_USB_PIPE_BCR] = { .reg = 0x2a188, .bit = 3 },
+	[GCC_USB4_MISC_PCIE_PIPE_BCR] = { .reg = 0x2a188, .bit = 4 },
+	[GCC_USB4_MISC_TMU_BCR] = { .reg = 0x2a188, .bit = 5 },
+	[GCC_USB4_MISC_SB_IF_BCR] = { .reg = 0x2a188, .bit = 6 },
+	[GCC_USB4_MISC_HIA_MSTR_BCR] = { .reg = 0x2a188, .bit = 7 },
+	[GCC_USB4_MISC_AHB_BCR] = { .reg = 0x2a188, .bit = 8 },
+	[GCC_USB4_MISC_DP_MAX_PCLK_BCR] = { .reg = 0x2a188, .bit = 9 },
 	[GCC_USB4_PHY_PRIM_BCR] = { 0x4a000 },
 	[GCC_USB4PHY_1_PHY_PRIM_BCR] = { 0xb901c },
 	[GCC_USB4PHY_PHY_PRIM_BCR] = { 0x4a004 },

-- 
2.55.0

