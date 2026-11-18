Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794987928;
	b=MfIkTmJdSEn6Vu+wPkF9iYYjpuBnJLukXR2alSsObOePW4pv1xMsIVcUtrsE03XS7IZ7
	 RhwA0wjRGnVElzMzgQb/iqu//3gaVrglq6XCq4pYxGALwjKVVvwJsEQO7gM9HXXxGaJyy
	 C3xXxK6u32cQQvMe5Sexe066u+O+X9P8HXqsrZhVo7GAG2Fn6+rbVTTnVeMQuCoDyYp54
	 Bm1JV1+HiKR9V9JJUp3WcrP2iYcK/WP2Lj2DBURG0Agmdknf89U+4fuMRQy7kuyWv/jRr
	 Q/hhkC0kMZldiyGO3RsgmdMJAmUs1xQ7jp41jzIZBFQfUQqPv/HDWzlWx8y/Tl9KU+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987928;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=kB6pa0Bm7wsI5L99Lqxz6kNj6rQFY6FcZYdNhihCalw=;
	b=xtg2uhIsULt8G4D87z3CiAOBtbrwTtJ4NSBN9hZoKU5cZhF+rpI7e0rSvIP5JrR5bVKY
	 BDJUDYZvQCqjsvO2WIZw1cWuOjWDh27u/Fx5GSb7xHrN/WBYIWNafjv7L5hB1UkeOZ4Vy
	 Udlz+2l43BxhBFLGdadplVPwBspppcb725iel0K4h0+3nFdQEjeqEhyRx3QF4evrhdErl
	 AXjfqyAvRxe7+/MfAxLMY4AJOQVokRSGDzscv7uB2sb9afPkyF2EhaWcbzDPZNgQ/fH/L
	 QpMu9IeFpUrVYuM2nCxBZNf7GfefLcbP8DbXwmbgoX7Z3JMtLO8uL8f5l9zk+3L/X5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aFxrvPYK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QxglUxdU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A9E606A32F
	for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2026 07:45:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4A9E606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aFxrvPYK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QxglUxdU
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2W5P14060171
	for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2026 07:45:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kB6pa0Bm7wsI5L99Lqxz6kNj6rQFY6FcZYdNhihCalw=; b=aFxrvPYKjI5Xw+07
	nIsWPl9AsqzVCvWbXVqYx/6ST8QP8zShBeJJ9acWuQh3BfHqtNXT5mK0u8WGtnrS
	cXUBkMDoWZHICymN2ly/bjTkL821sxV+6PcMbkRkRZN1BgbWLgQ11AKVMgW+RyEt
	PyjJZvno5hIX7KaNFJsgBElEBk4JPzfOp5hXeKXmJqA8Iw4+oW/POjeEFU1ud9vF
	7Hc276F6KD3Bn07FJel+msonq5kT2zp3J+fteWeax+Wf6QveO/V9GSGgtOWccVdS
	Wn6bXYWwOcBSm281MYU8PSRGCEYh+GneY7RhA2xldCIl1U3zYG44bSu7xQEDpRbo
	dwKQCQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvchwcg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2026 07:45:26 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-920f97bcad4so11539016d6.0
        for <linux-clk@vger.kernel.org>; Tue, 17 Nov 2026 23:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794987926; x=1795592726; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kB6pa0Bm7wsI5L99Lqxz6kNj6rQFY6FcZYdNhihCalw=;
        b=QxglUxdUn5PNgbvEIiew8GWulL4KW5QE/QrsMcGvSUSQ46ShwE0QjtYFZiG5pae+3M
         Qx8hRv1u0hIJgVIWNMT8Hh/JyXL5t0SExK5MEriClAlozQzIfWioSEv9xMlrICmJj+r+
         K0qKf9OoR5RsWahgbAhGaNzVFknF2/epodTBWGCsC/6EYGJmRy9yk7smerxM82DrMP60
         V9Oz0K8FQclDf6pqsOhEodADNjYLqZdvGS1/1iq6MsOa5q5fAyzfXwLaOn6m0UiB01A8
         O9aKm1n1OVuFb7dgGtbAt/9CRByhPiW0HScg40YxCTeT3UuG8CirS0cr5jxEVJbCFP6w
         4O1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794987926; x=1795592726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kB6pa0Bm7wsI5L99Lqxz6kNj6rQFY6FcZYdNhihCalw=;
        b=AVoe1WHx6Dco4TnignruHUV1YrRGKbuCin9qB9dXAXvxku6euP1e5fHzgFAx2LeIMm
         jXZnebuZ3K4TJ9geQVhIrWlPDP5mzd2I2ngSlJ9Zu4oUu84ESbo15vowtmJtljyp0xWH
         O0HqfymWNncsa5w4ypi26lITCCUt3uf8c1ou3Jkq2VL9Phaqz9ztAX5v+JpguGTe81G/
         49zPbhWJm8TIlkQ3FFMeHLXLnosvLDNNR/oDerhF0k0SDPocuRb3O1KhVunrWKaPdwSM
         NcZ4BdGty4BCmOP3GUXzcYdfguxx8ki5KRrz1++PjG1AgoQYtBnhed35H8WGybqYBtGy
         E8yQ==
X-Forwarded-Encrypted: i=1; AL+hErErMS0uK3BQ1ONIOOXwpBXEgrBnoN1hZWs1ce9eg46yjgQampfqNyPmnXHt90TxqNkuGbc19tlTUxo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xWSDcLyZjd43zh2EVtQnSqx/ampxgmdF0HMkYPmIzLGiXk/RD
	DStsqaycNuGbdi7Idt2N2qTIRM4wSWQ6qz+EpCWqnXWUSdQEyjWPwiDqgNsVHGmVY7LYUWtnxSk
	LnxH0KiQvaLewHS/Iv10/33o6GqzSeQKxMTFCcBbO8YWDbC2bmeirKhuZZhqf/S0LHhWdo+saWg
	==
X-Gm-Gg: AYBFou3xu192SRE26c6avPBeu9zayFjPNTXYmaD+GNT3176F0lTsIrlH60xnEKM9gfK
	/Mc4t1/1Ot6FyL0aS1iSk5WDBJ7HUdiTXgT/pD4QN44VhMgCDibNalCH09zlyGqsL730NVEWOwE
	stG0HYMFjNLwWXgbAFnPNKivwmhLzatdct/DHooAaGUN5cY5tWCqL5gtpBQi9wwJxiQSsvrGfzE
	M5kK21MA1oaNaVGii7mF9j/YfMgix8tTGB0QcJL43oUzXrMKI0XpJzEzA8XItA6WQrEO+IU9ibJ
	LGNT68xCy96B+2TfYhXroY+3wa3V7Ix3FNaWsj2Lvxn6LtWxlf1ox9QwERaGN9OLGEEXUL9W44N
	b8q6V0A9x1t+85YyFc+r0S1S/cAe0YxrUZ6OegAXlLX8lElxgFen4n2rch6TspImcxYDKVaSEwZ
	+HKGbXncguIi9LnQGCAbwNe50qP/UQw2a+P5XRnRz8
X-Received: by 2002:a05:620a:7008:b0:93e:d051:8f19 with SMTP id af79cd13be357-949995b5a85mr336679985a.40.1794987925915;
        Tue, 17 Nov 2026 23:45:25 -0800 (PST)
X-Received: by 2002:a05:620a:7008:b0:93e:d051:8f19 with SMTP id af79cd13be357-949995b5a85mr336675985a.40.1794987925459;
        Tue, 17 Nov 2026 23:45:25 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b7b8444sm119359085a.31.2026.11.17.23.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:45:25 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 15:45:06 +0800
Subject: [PATCH 2/4] clk: qcom: camcc-eliza: Declare icc path dependency
 for TITAN_TOP_GDSC
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
Message-Id: <20261118-camcc-fix-v1-2-279d269e343b@oss.qualcomm.com>
References: <20261118-camcc-fix-v1-0-279d269e343b@oss.qualcomm.com>
In-Reply-To: <20261118-camcc-fix-v1-0-279d269e343b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794987910; l=1296;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=N47i4mUAgUxwVA8cbwb6AJJ/1VLcu7+A2P0QHeIkC7c=;
 b=lpOId+xT4VeWxoTALhDcRN4ApvIdF5ETHZLAs5kUrt+u1qaKi2x64xSrrOAp07xRWnquikUGs
 FFC5bNsQTGnDMDhvVIeLciCRnrja6daKitVbzcaB1boDcW7s7diO7KR
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=R5OWitRX c=1 sm=1 tr=0 ts=6afd5796 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=schgL9W0h6o9fvJNLFgA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: -aT3e9R5I18pLPwZfJE8bWt462_188aj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMCBTYWx0ZWRfX+XC6VAOfRGdz
 qyGS26785X2oVYgzzvoIxj0q04+vk0uvlm1IwXk0JB4HN1iJ2H5MNYK1glaF4L0PYqs4G0n97R9
 uwm2zaNuCCgGGb945yXK/FqqYmeAm9o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMCBTYWx0ZWRfX2znp6iQ4uBEx
 5dzgSGdF/5n1QmV4WhTN/OFPpfsAIxZ1HkH19t1LAzar2bDxsguo/HPo2i/xS8v6GpJf6oGkWJ2
 zeabAB+A4UD0NaeKkfNlPe5OCwxOeEH2tRW1gNSv+Vq1UNt3p06btSxKR22lQBPH69ez68Prae2
 /f88zh6weLk/OYEk6/tYjy1CM8+TyZUI6vAPleMLWMtCL7TthlhF74cI4/3txSRP9nCj9Ert+0w
 q9gNTRm8PUXLgW3MGpjf3LZd0MIrtUtndIU7XwT3Ubm/tHaBzkdgPjEkLlOFtJqn+4fJPdfCGBV
 PhaPe5EWtUlw3j30j5GLVZaaNyLh/wZpWDotH2Lw8fAFNCKkEctH4c4z0EfgNnQ0QVvekuLZUO6
 e3/lxtT+6/XGseOUHJpx337qZ3sPuuosIYHMrA7JyIcahKUWuuz8vHepJBc0/+IHg5ql2ziFPFt
 y9kPsfp5c5Svxh+HVkw==
X-Proofpoint-ORIG-GUID: -aT3e9R5I18pLPwZfJE8bWt462_188aj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180030

The TITAN_TOP GDSC hosts the camera NoC (camnoc). If MMNOC is left
without any client vote while TITAN_TOP is still on, MMNOC attempts a
power collapse while camnoc may still be active (QACTIVE high). The
power collapse then gets stuck, and so does the MMNOC BCM, so any later
bandwidth request through it times out in RPMh:

  Error sending AMC RPMH requests (-110)

Declare the interconnect path for TITAN_TOP_GDSC, so that MMNOC is kept
voted for as long as the GDSC is on.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/clk/qcom/camcc-eliza.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/qcom/camcc-eliza.c b/drivers/clk/qcom/camcc-eliza.c
index 7348f4dde65aeacc27182a926a8c0e5b88eacd74..389fb580985ea8b667ab8cc41c6675c0d9057a42 100644
--- a/drivers/clk/qcom/camcc-eliza.c
+++ b/drivers/clk/qcom/camcc-eliza.c
@@ -27,6 +27,10 @@ enum {
 	DT_AHB_CLK,
 };
 
+enum {
+	DT_ICC_TOP_GDSC,
+};
+
 enum {
 	P_BI_TCXO,
 	P_CAM_CC_PLL0_OUT_EVEN,
@@ -2526,6 +2530,8 @@ static struct gdsc cam_cc_titan_top_gdsc = {
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+	.needs_icc = true,
+	.icc_path_index = DT_ICC_TOP_GDSC,
 };
 
 static struct gdsc cam_cc_ipe_0_gdsc = {

-- 
2.34.1

