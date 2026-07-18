Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F56C388391
	for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 12:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784379454; cv=none; b=dbUktzMJfrm6PD2WDBgR6TRQ5qlcbHzZfDKTf58gs3eWakOQxoRxDNdg2UY9jJB4IwKi7660URGIscSTQ9byr13UJK17I3UgpElPZ4gYfBcz1whwGGoFB5w+Ldl29RlVdg751ASp4EXY4NTnUFtrWQNlE/FCO50nPtG0hhc+51Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784379454; c=relaxed/simple;
	bh=+XxCxyuet7T3qjrE5preDyooRigNRSPFJmQPD6VhA2E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p2mlF7U0mttV/N+uwPtVzR8d1u8wq0k52s6LIruglQGgLdsvJtJHh01nugdex7CLNW8bCAxnvxVi5FmNiyzLH/OkV75Esw/j+0Vt20P77+/q+0EU0E6rTy6VjzHuasU/0hE7gZBFoldjfvDM7e3ZbJV0TDnsQ6HUgy3Ry6ktOiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KVDvJyBE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ij1TBII7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KVDvJyBE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ij1TBII7"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IAHUrB178729
	for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 12:57:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	voohPrGDmmhyk0EbFdOyXWY2pG21Ic6EXwxY13r+PaY=; b=KVDvJyBEHp6OphM4
	cMnVHmrfW39oLgDJ29V9qyhUwFuveLPARJrAYQeCOCAhROqF9Dm8VaXzlg7ZhnIq
	3kylAvfLKOd9RSnJZBIbAjHeqHAcmOaHhek0fkQUpZVNPjmQLKT5ZkZ4HXkwuOnH
	aA5EOrZ23vjKGkhJr+WDpGutVK2EP3VrfmAV8Sgb0NHkpM6E7hk9UyXkcsBl0qHF
	aLvabE0hUeCvVktK1Gg2qr0Qff7z+n4xP7qfRNAhHxhcEm5FqFYuY3XANEwyUYQR
	aL4VervTMEDN7Ad9eWPAp0NMSzZZcY/lHt+yv9erka7x06p+Wm7ETqxm61CYhi1M
	pLGPoQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2s7rqan-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 12:57:32 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dbf293831so12374944a91.3
        for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 05:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784379452; x=1784984252; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=voohPrGDmmhyk0EbFdOyXWY2pG21Ic6EXwxY13r+PaY=;
        b=ij1TBII7CKWd+Ll8YrZMJvJgfXqEbIbjCFgumlfBsTeKyyDcTRVDwMIGxSFJaxj17y
         8TBHEAIKJbky+C3Z5qekVChchMyaL5qAGYyZijQ+H95Sws8v7hFAPhq4NmSzbIeiZXzd
         eG0eqeMWa2QwnCNwXi05SakdFejnvZ5eAq1kYx9G/h71gxy39Rz359iQwz43ikJmXEIR
         R6kMRRvFbvExCjlTGVUfv/kk5FoSrjG3gDXMHOuBjU5o4fFOa8e6jJ+vQascgtsO2ZD2
         /DqsrN1TMrh/rxYPduKF6lKDN/isA3XzAVoQagb7NJKK+xaB4BboIvgvORuOgNFkp+U/
         qx/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784379452; x=1784984252;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=voohPrGDmmhyk0EbFdOyXWY2pG21Ic6EXwxY13r+PaY=;
        b=aK0CUviVYXAX6I8zuNdpT5HzG4SWwtsDHAWJWJDACHiGLhvH+rW7MFfUzMzQeTnIoA
         KhhGFuoUVlMq/eu53UeGxyjk7zc365q3jTz67FP3sS9mf23jS2i+yuESc/i3tJ7x8Lc6
         GlsxPmSdzPQ3+mhmWa7CCqmrtirBRWBDjs8ANu+tCrU20qo8hza2hHu/sZ66k2c5HNKi
         LRIoTYFHJlf0tig29GtIp20aFTdIP8DA7jGegETOxtDRP3M5zxg7fDfRA4YExwY9jd+e
         blZCWmSkP9DcFlL26rfRatzR1ggU+cQiwHCxaVAt+11zajuvADYEaW6pWOUla2qrX17L
         fpEg==
X-Forwarded-Encrypted: i=1; AHgh+Roxr9keb+kcSli8iUIwad8x1GP8gpRDm3iKWTiiXi3IChD81l1H4PZYxBH5elugDbgmCjIw37XdqUY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCaJtwZXGgTZcYF2G4GiSwrQA1nC5Omjk8EEROuFmk9Q/osd7m
	5DbhAgT7hE6F5LdJkQYVw8V1tzAwLFm3HgZWqmPEKW4yagj2kYIn0G/btWUR3KWYcqvLJS3Bb5Q
	m3grYBCh0uscGpO3LGlMVBfCcW93xWUVYwMmN0Xcklmg8bZ/MSFi8FNYTwO+RA20Zu+kWuZQ=
X-Gm-Gg: AfdE7ckE33OunM41dDrBnwRbzZweynimv4TmVEKmSCTUT6Y1Niz31Ra+8/QJvX0Qg6t
	0JqwnlGqYpNB8f1WF9AMRIJ12Y15Ur3SXUa21QFz8PWxIRRsETSnn0DqQGYOJ68x4DYWkozJFHF
	8IW54nfiruE8kHxSmK86K1byptaJYNg4CwtRn7ETKeIeO6mSMFqMHlsC+GsykZh+UJaYWLdFrLI
	2CFbTygso7Aasg6iyqRUty0bo/rKWo0nRAtyIhvkTklDQH4PLtU3Xw3ci3lwcAqaGyMRSsSvskC
	SanGuD/3ODtX23vNJh1xYAwNxHv1YcWezUsBo72qOyGH/J3GayFZSTMKjzaS0vVe65Giwf0WqeY
	RnYhDwlBrJaUViXGVstr+zAyCmNjqdEY=
X-Received: by 2002:a17:90b:41:b0:368:af5c:5925 with SMTP id 98e67ed59e1d1-38e4b54614cmr7280482a91.23.1784379452082;
        Sat, 18 Jul 2026 05:57:32 -0700 (PDT)
X-Received: by 2002:a17:90b:41:b0:368:af5c:5925 with SMTP id 98e67ed59e1d1-38e4b54614cmr7280449a91.23.1784379451690;
        Sat, 18 Jul 2026 05:57:31 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2a18a47sm14238910c88.8.2026.07.18.05.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 05:57:31 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 18:26:18 +0530
Subject: [PATCH v6 11/16] clk: qcom: gpucc-qcm2290: Park RCG's clk source
 at XO during disable
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-shikra-dispcc-gpucc-v6-11-62703e05ef0f@oss.qualcomm.com>
References: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
In-Reply-To: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfX7CtmmRoFntc0
 +Cv3783pTh68Dppsf+RI94uD9CSjieVCV5FgM4MeP5v1TKg0BMy0AN+XG1hh69RcRtiuGUnOGnd
 O0N8NwXTkPkS43ERfbSVGy/zHZrdrk2uYsqyKllL3jJcZ0z1KQH7CMG7EWczGYCcyUq7WiJeoWI
 UzKZpvlTTZZllaAtGawwlZrDq66He9PaQcqT54B65737TnibzmaxSE9jFmhxdcIc4WPTRbbHZms
 JKn1+BWEuLGna00/vZ/xs2vv+9WKgla2aSwrHaIfSSApf9iBJVtruXivBVUbxUgoSd7efG8XwKv
 Eygpm4BD3/fHUePMKLp2IGRdFY/Ac4MbxO2ngltdOxsIZOkJJ9ufh97wKaQFamikuUhvoVQ3lPm
 w2wtPCVUOELTvtLiDW9Oy7Umcq9rmZZ9lQAdQWGRSCFJGQMQ1P1VpXffqTpokttcdlUMrPGXchW
 TkuVSmpvMK0K8LtKwkg==
X-Authority-Analysis: v=2.4 cv=eKsjSnp1 c=1 sm=1 tr=0 ts=6a5b783c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=vsOEvA3BJYGQS88P8KEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: gety3a4xVKbnNDheNakSbTWcB8dVaZhy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfX2URRumE/XVtJ
 Pr+MnupnHMr1k1bziQcmL/ECc/aF/kGsLoNT+u3zwhsCmzjNjpvhBtluXerWIpS2nVHJ0lNB92f
 yU8jL9P/dm2fKbDxmJCC/i5e0vnb6+k=
X-Proofpoint-GUID: gety3a4xVKbnNDheNakSbTWcB8dVaZhy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607180133

The RCG's clk src has to be parked at XO while disabling as per hardware
team's recommendation, hence use clk_rcg2_shared_ops to achieve the same.

Fixes: 8cab033628b1 ("clk: qcom: Add QCM2290 GPU clock controller driver")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-qcm2290.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
index 78797b77d7c7ba053201064ace3963cf2bd5281f..fc33d82bcfb6843307d002d67674253f0174cb4a 100644
--- a/drivers/clk/qcom/gpucc-qcm2290.c
+++ b/drivers/clk/qcom/gpucc-qcm2290.c
@@ -144,7 +144,7 @@ static struct clk_rcg2 gpu_cc_gx_gfx3d_clk_src = {
 		.parent_data = gpu_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 

-- 
2.34.1

