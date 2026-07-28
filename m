Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2A54248B1
	for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 11:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785239076; cv=none; b=gWcLxbwRLOWOi1aDzWmLsJQF6kWxeSdtqKRGm37IN/ulWBO+zHtnygbcgTdyRWzUqYuMFTeNE7LTfTWjHQ/LqK+7gqUAZFxV35QCuCE2ik/zyFSebSXz/0RrOLEbG/ETmwqj5lTRXfgpNHYdQ892VODFqSpDRKdObGHFkdN0wyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785239076; c=relaxed/simple;
	bh=NUmY9HoDyy+tCMoMSRiHT6CAVHq41HWn8qpLFdXnFIM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kVT263HWYtioIjKWQCCgXiDSBJqHiPJJkXEQJ+S3WWf106NY8CG66NqI3JqjkrIxepYxLJDU/uoQ7nP9gtX3FS1agh3TQDed2aYUp328YxprKH3yojyaoXhAJ1LBV6fscqAGcyRGWiAwomu5LVb1tDVkDQbl/XfB6O2nionAa/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dlWMw7e6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YbtRHuOn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dlWMw7e6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YbtRHuOn"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SBH2nF2776812
	for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 11:44:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qa17nlAEivQSWbzaXs80kMBBgDJF4lnbbP1Lr7oQ5Oo=; b=dlWMw7e6Hx+zrIVY
	mwfo8+7Z40SpalpbdMg5hMDhB6cemlZSw09jDWcABAp8hXc5CNhP1hvy0fbfM+pM
	l9UliaEl/gRqljos8B1lP0wtCg/OmxfDgv5kA5Dn7oDpcIgtrwKfHO3ox+XvXoIF
	z2EMctVZA3TPllqIWu8joxRoRijqNrjoZND3WZR6RtfhO1GyzamiZgRvWXuaRtWs
	J9sdqE7fPmm3Pa9e3wwYz+4FiIIY6i9I4/0EEbOMEL9xg9xm2zJgvOsddEFL9mxA
	V1o4ZGlMiVe18xdQ1yWe+/+xCkEgyXGXD0KpVVZ3Jz3ldZWxLaT6fbPQzHf+CAkL
	2qx/sg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fptatgc4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 11:44:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52769fc3f2eso45552761cf.0
        for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 04:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785239074; x=1785843874; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qa17nlAEivQSWbzaXs80kMBBgDJF4lnbbP1Lr7oQ5Oo=;
        b=YbtRHuOn/ti7FIDOtEF7qj9YnrUkHepyBEdWBKjAMkr/g5Ya4CrrXjmMjtl5xwXIJH
         pJDcGFnYT1FPkZUpRJlnl9Fx7l0KszMz86EGF3F79KkWqNx5+cyo0hkTnRW0QzAaNjbM
         soNoymQNscECPNUv4IAUE6pxZR7h0bX/67rq4tr4obULJKSE4JufrdOl2WDBIP/qzYNi
         wzaZVt8sC1M3yviozuGOb2VAHyLe/nVb6JtwLW6HVRnrW1Hh9KBzUbhEZOf+jh2UoRFQ
         wXBMal3S8Jll7xXf7TYmr7Q5djI31l7re4wqjmFi0Vki+IklMm03pqIk6VSw+KAdt6Xe
         jVXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785239074; x=1785843874;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qa17nlAEivQSWbzaXs80kMBBgDJF4lnbbP1Lr7oQ5Oo=;
        b=J0C12xzzkt9LEqOCqhj2iARBU87ZU9esjC73vqjJUsAHk7bbSet3mZhnJHstKA1Wky
         Cfbr0eMdSrvsq2Io8mcuC7rvqIzfWHw90jHss8pkJ5KlNrS0zT4sD+9HAVMtw7k1Jv2y
         HCcNmcjhRv0fuvxIV+IaezDP6X+QUH2MMe+xBxBCnzs/4RFZ3IkwV4hxbvZiA+HH/4eC
         uZy96tXGQCqTCEsxKOSajZ2kqof9z9iSy7QEOZRApwIVdXgczxZL4G2XRAnPKTitWrd2
         mbVrHQEecyGbGQUh2tIjnHOiUC/DYRvo88iYpzvo7KhZ/AdpuBEifDCjkHGqGCt0khy3
         VSOg==
X-Gm-Message-State: AOJu0YxBsLWeIVmXItBPUy6cZZu0xiVaM3ybaP0Xqj2ndq7ZLkmaeW6D
	GryiQU9dLqlO27e3k0HaX6r19tJPgTb46rNPD2XYeKLxByE43hcbL7keisiOwClmauFE25Vs9Pe
	tjDyssktc+50th1hfHOWU0b2PX9LA8yRJNLjdN4OITs42/jaMs9JV8z/FefJ11SE=
X-Gm-Gg: AR+sD12RvOvLem/Ryw+Rrbs7QyR8POxEnYjGcEh5PytEmDgkmY9bedP3uKgw4Kdrdml
	U0SVXrawqI+k2jKPm+L0P505/RaD0nWIsG2ukN5nZS68KAl0EZNQboRXYKZwauN2dmt2mvx9P83
	3SVnM9DJ8H4K0hA6UfSXTweBukPUpwGhoMyPN8Ip4DlOLZ7PtbuU00GKqzQ/uKUBTnGGUSGgMGy
	Sn9ENmEKrmPs/uuXbR9Ybb0UWVb/ENLiKYzOzW1Tsn8yqKBHr510oZT5IycCC91KeoDvjeVyUgm
	yt9NwHvrR+QnaasZL1mablVuUL3s5iFzCA3yqnbFyLnByLoJhZkve+9zpmGKdo91RY1wnmlDApe
	kec9uPS1uYUSEJOs+J8//tTdjue4=
X-Received: by 2002:ac8:6f07:0:b0:51c:ae7:fa1d with SMTP id d75a77b69052e-529d709e483mr16956541cf.5.1785239073393;
        Tue, 28 Jul 2026 04:44:33 -0700 (PDT)
X-Received: by 2002:ac8:6f07:0:b0:51c:ae7:fa1d with SMTP id d75a77b69052e-529d709e483mr16956121cf.5.1785239072790;
        Tue, 28 Jul 2026 04:44:32 -0700 (PDT)
Received: from hackbox.tail37bb1b.ts.net ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c46160dfsm68407265e9.10.2026.07.28.04.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 04:44:31 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: imx: imx8qxp: add missing MODULE_DEVICE_TABLE()
Date: Tue, 28 Jul 2026 14:44:09 +0300
Message-ID: <178523892597.3206426.17434896362828109375.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260705001705.70400-1-pengpeng@iscas.ac.cn>
References: <20260705001705.70400-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEwMyBTYWx0ZWRfX8PrrxYlRuJtI
 10HrT1aNLBKX4CVC3p+tmVllHoJNuu8369OFNmnppr0wf/HrVs/VXa32Wm0MWR3saxWaDpcizHl
 zX5sCPx2EpJHVC+yei21etpxhiKwdlU=
X-Proofpoint-ORIG-GUID: BQSJHhXLUUHaeleSrrkWB-vncrZ4wzEo
X-Authority-Analysis: v=2.4 cv=KtJ9H2WN c=1 sm=1 tr=0 ts=6a689622 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=_ysCb4Hr1M9gRo8ogBUA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: BQSJHhXLUUHaeleSrrkWB-vncrZ4wzEo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEwMyBTYWx0ZWRfXzJbGjjKv7WOC
 kBwYqJ4Z4oxPTB7e9GZqvkk/Ep2F8qARyBeW7VXGVkmEZur7R7MW2Boz+K4L6fvGTu5qdM073Q+
 wMA3U8OfRIESHqMJky3nvW2jtg9fp0iwzs/nW8GxJvu7Wb7dIdvwxOcbBFl3weUpk4wmCkDpqAm
 CCCR3eakFw+3j3NuHtcXgmjOlJMJkBBgFb9Ipd2u/or/bLW8pvgWBGSlEM6wohQ8c8eOJMpELhZ
 TRvn8XDFqf+m/QdLXXwtTyNWNVNFioMtdUbFb6er8Qii3jU1D1/S/CTrtOW/+Dq75DQra0wZOd2
 ORSv0CztnghRVt1vHRS+35QOedFqVbuXGxFD0IGX8x/XsvMGoQZQtmSRaOfqKLlyysLOzS8fluc
 tpu/zYcF3RLRnvPmNUtmCgWAQ656XN8tx3UugFBGV1e++xleq7dhZEYs85vNb2eJo8yNyIlvIai
 wPX52+7WkCfIlF8utbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280103


On Sun, 05 Jul 2026 08:17:05 +0800, Pengpeng Hou wrote:
> The driver has a match table for the of bus wired into its driver
> structure, but the table is not exported with MODULE_DEVICE_TABLE().
> 
> Add the missing MODULE_DEVICE_TABLE() entry so module alias information
> is generated for automatic module loading.
> 
> This is a source-level fix.  It does not claim dynamic hardware
> reproduction; the evidence is the driver-owned match table, its use by
> the driver registration structure, and the missing module alias
> publication.
> 
> [...]

Applied, thanks!

[1/1] clk: imx: imx8qxp: add missing MODULE_DEVICE_TABLE()
      commit: cd21fdcbef3fb32136f72075ab668b075423b3f6

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>
