Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810E321323C
	for <linux-clk@vger.kernel.org>; Sun, 18 Jan 2026 18:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768759507; cv=none; b=Ea/KUssobXITEDxTvnoRF26+LTZFzwmuhP4KDZvUscvy2HYG0m8qibeMQIvZWesibMudvn8sOvybqoJqzeFSGeeu/Cp+8ZyhA4SRuRX2vsOHq4CTcTTMzgxtx48jRqgvEvDd3z8SKxTZznllcKX/YjQhxW9oKwBgUWAAdzxUkc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768759507; c=relaxed/simple;
	bh=Xs1SEo7FTHJjNKqwYr1uR66mT//ADDcXwteCdd8Pmjo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mPZfxaFiSbfEW4FNifEXX+DwSIXjS2TGQ4Sot7jNumyEI+3vmOJxvNke+SlrbnVL56AzRXaNE5lnUfaKW02WKBakybOj5QEX0HQ3obqT2tsiY9jA80O4df14m3xVEs0gZ9ZbRYIvqASDNSLZwQjbKt3Nz3fuMG814OS07Vg4UUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W1+qbaBR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ARplc/pG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W1+qbaBR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ARplc/pG"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60I7erMf1338677
	for <linux-clk@vger.kernel.org>; Sun, 18 Jan 2026 18:05:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pP3z5dAZQekFVGwYrRijf6qQwez1pioEdAikADgTPEk=; b=W1+qbaBRmXE9Cktv
	oIMVm0EvrSx1OwTy9S8AmbkQ8ZCbNC2JsvV4fRY5HcqHoGmS5JsGL047uY9gotDT
	Ws2kTx1wLW4IV4GwhOIAcUT3bpfWR5GO455GjDAbu+CsALXt+rytZr43sFJxFJjT
	B2Cs7nJ2Udp3h0GbEsW/vziOAlDunoK4FaWzs0dn8VYfWkrJ7fIZLSykV9cibHs4
	arMrFhBl58HtxRTeTqCgy2No/kV5PmgMVLj1LP1QVrL5Y2ucWuslpGP9V28ThWZT
	71s3nBYv4+tc+L5fp/wYwWV7Vd0GabVAdNMVBrnvRQxZRxz6xASeZb8qO3Z4imqo
	GU6zuQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br20x2v9e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 18 Jan 2026 18:05:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c52f89b415so917145785a.0
        for <linux-clk@vger.kernel.org>; Sun, 18 Jan 2026 10:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768759505; x=1769364305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pP3z5dAZQekFVGwYrRijf6qQwez1pioEdAikADgTPEk=;
        b=ARplc/pGaZljsffjwoA4pWk27++4iAF4zOYc1D91mHuUDAaydHTUtXFuHz7/Ral6IU
         d90ieXk0ZVfjZAODKdBdpcEzcOoWOe4rxIm5/9/r58o7ckUVsSiTvSi3BzSxT65A9GDW
         kiu2Uo31pxwodg03KfhrhEIq0jr0fbMPhmOWPoTZdF/kbJbRvu1jJGswPjX4XCj0bmYg
         Ju2ReRNYqRCYbvodlYBf1s7UsD3l2Xu4JsBCT0sCHr9AW6CDZT2NIPkJ+n4VIPFvnlui
         AvC7OKVGLdMDL6UCcTErhZkocI3BsrVOECmsIE4KrN22S+jEA1bKVgKwBnFqgL2BdP1c
         7Puw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768759505; x=1769364305;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pP3z5dAZQekFVGwYrRijf6qQwez1pioEdAikADgTPEk=;
        b=QDswPCsUu5pmDJHKusgubIABxiNtNnY0gdd+WYCUTQxdaACHp6RbjZBC34UPEX/zr3
         7rJ3n9p4CGwLxDTpQqozIS4ZENm3aWqpNHUMn10VkaMG8Cyd4ZSXkQPGV12u03uhjs7A
         6adpM1yX2PCFYuT7A26/38lDPwUzc7pO29Z8lINZff4UVus8+y8uxlRG/C0R9bT4CCCp
         Hw1MYeV+3L7rmzYSMopCeM6r4ezUgQkLTO36+NIEhxzaxtXmy8MzN9aXDoReMjYoxbIt
         2OoYlVHSV1JH9cmkf5iJxr+2wLIEOSQ0yV9he7Z4jLtQXBOgLg+fipzM+2pLYUQd4o/z
         Z3aw==
X-Gm-Message-State: AOJu0YwJkVqgR3bdkP/uSt+0quLm1DkoGMO5VGB5NFf2v88DP9DiBDtu
	nUrvF5O2apNKmvTEWGoZs61IlNYtd7r2Y6NpexBgZxj7YiGvwc+GUdMU5wWQ+lV5JGvP4AG9tAm
	BqI16lNP/OjLJ3IC97VRt5gFCYwnIlCPfAOqwb5kwc3ZBc/4iiNgxil5quW6Ggx0=
X-Gm-Gg: AY/fxX5kC8doZvEjy4iVzYb8so5d0ry5VRT1u+xmULDzW5rvnKumv0dZ+/v/ICaX+N8
	xpgVVfH6X9EynAPeOmLG5gnjF4NjvfqTnf5RBJ+UwknEfdpQl1FWQd6Htpmr+dbNzMt9CjJ3Hgo
	dBRPwXaWj1V0OI6x28HV5Gk7nrrRwuYTAKQS7sZdi5ApSijNHr4bSf9AKc+cbllnWDWd62jZrMS
	S2akVJzXFNoSsbsLxE4RmNYT3cb2i/CWRLaB8m6oIZHJMiTNpTEYk1+ivhoGE6vo2rb3boUMGNW
	9tdL/SNnj/R71zCuM10vdJyyX7WZMM+ADaxcBBuO+3cStwgF0M8U9yPuBX6HCfrxYJNcR32/+yd
	sJcUqqLoBHxJGT+vuXA==
X-Received: by 2002:a05:620a:1a92:b0:8a9:be12:75cf with SMTP id af79cd13be357-8c6a6789994mr1324353385a.61.1768759504577;
        Sun, 18 Jan 2026 10:05:04 -0800 (PST)
X-Received: by 2002:a05:620a:1a92:b0:8a9:be12:75cf with SMTP id af79cd13be357-8c6a6789994mr1324348485a.61.1768759503901;
        Sun, 18 Jan 2026 10:05:03 -0800 (PST)
Received: from hackbox.lan ([86.121.163.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959c9fbbsm895290366b.38.2026.01.18.10.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 10:05:03 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Marco Felsch <m.felsch@pengutronix.de>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Primoz Fiser <primoz.fiser@norik.com>
In-Reply-To: <20260113-v6-18-topic-clk-fracn-gppll-v3-0-45da70f43c98@pengutronix.de>
References: <20260113-v6-18-topic-clk-fracn-gppll-v3-0-45da70f43c98@pengutronix.de>
Subject: Re: [PATCH v3 0/2] Add more PLL frequencies to i.MX FRACN GPLL
Message-Id: <176875950215.776971.6809475873129036487.b4-ty@oss.qualcomm.com>
Date: Sun, 18 Jan 2026 20:05:02 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE4MDE1OCBTYWx0ZWRfX+zK6L0fw1h3N
 cKPk4b3vCSmiKHfvASEH2mJ7VK9KzSO4r8xuKEKLP3WVGKmvDqwY5dYm6WRQiehawl4oyditxRR
 DXbXXnthrJqJqlImUdm2AAnXWli9Mf1sDeC6eOoaFsTqcJODZk/KDREKNdjMIXUUvKZc2quYWG5
 b/rKhbDB0YHXhnz7vc4uhx7WW1/8mR4IfeHCYKIewCjU5+gGlv6TX/u3nK2QZbELOTXo2JfHxEZ
 WhrGI7do1HHNAuCTb6Hxbq+ZUiU1uBcs1NLBmtw91Ifpr0uJf5iBHt3jCBJGzWtP3zZZPCv7Jx/
 A1rb+RET1wdRt7c80nwAh5flh++97ndVgwAdnJD+wz0XT1NGVe8SfbPw5LE8ROORGBOE0uUuY7K
 h+EGTwKvgJjDhU1Tq3Zi+hh3S5GOQXCaTGZdwPEGYntZCj5VXTNKmEA8ElRT9ksbOoigFIgTGTe
 EWWT3I9DXSA0sAuEcIg==
X-Proofpoint-ORIG-GUID: Vp0OvW_LWO_83KbHeDkYiPskrX-N10MK
X-Proofpoint-GUID: Vp0OvW_LWO_83KbHeDkYiPskrX-N10MK
X-Authority-Analysis: v=2.4 cv=abRsXBot c=1 sm=1 tr=0 ts=696d20d1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=RUlelSpolvTNyr7Sls5SJA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=jAkwa8wCkOQO9wpXspwA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601180158


On Tue, 13 Jan 2026 15:52:40 +0100, Marco Felsch wrote:
> this adds two new PLL frequencies for the i.MX FRACN GPLL.
> 
> Patch-1 was previously part of [1]. The new version of [1] will drop the
> the patch which is now part of this patchset.
> 
> [1] https://lore.kernel.org/all/20251202-v6-18-topic-imx93-phyboard-segin-av-02-display-v1-0-9c14be6c7478@pengutronix.de/
> 
> [...]

Applied, thanks!

[1/2] clk: imx: fracn-gppll: Add 332.60 MHz Support
      commit: 9bb910b049402b7a3496250c9c6ab169aed83d15
[2/2] clk: imx: fracn-gppll: Add 241.90 MHz Support
      commit: 3e6b0227b93c708e93e33f6c3485bad077650766

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>

