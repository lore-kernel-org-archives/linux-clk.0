Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100203;
	b=bFwqUzy/qBImEY+6eaD1GBf3ty8gNz8z9D9mbk1ztphCb1Tu3ZDB5h8hb/7piCKEjoZg
	 QZsESIWA9nhQFSvjww0HSEWE9che8/YVFBAJzejlpwivZiuVgPeGNTOGE11cwfkg7T0FI
	 ugpyM/RxmdB/CY6QLP4z+Q9TkVbNRPyZ4mUv7OAtWfOMLMDjFme1uAT+XxGg+6YeQ0NWP
	 IC/dC1gF2Vmwt6C6qUlwDp/M4UMXLWnXcHfD6rrXqm42ZntZ8DLrFdSIhhUXSwtE1zl+X
	 x1B0j6G2iXL6/gPpPOrQP4Gr+ouUfof51lsrTuKQatXR7MEKr8ZWAR15e8tn+v2c85A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100203;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LCLGT3dGFbYN1moOX5comzCHld4bgy4ncy8r17Egy90=;
	b=Lus2u2kO7J1uOjs8IIcOXOsusUk/8bNWTkr1SyArDG6qzNDzaZzqQWXKQRFqmj0py/ji
	 fjh5xTVuWSlS9uUMzEpPzOwCTlzWF+GE9s1+gazeM3hZWd2VZUPompq7n9ne3AoSzmKE8
	 yjcyiCS6tGzZZBcHgNKQ6lqPt3d5teL9L7O2dTHOYsQDNqaiJzhophYxyr7gAIXPEs3Nv
	 ehMs1/9M5PWB4l9DGmwNnUXJvPNMqaYIPx0HyAKxwcGVxFyxdUNcP6faisJOblixP/zU6
	 +AaHLK+H/83VXO59nLI2tOSCZUMu3qdGhNMRkHaw03pG8xHl5ciE6ccWof4/yI4M4nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D0SkzBCp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JKM+lQbB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A129E606A324
	for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 11:23:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A129E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D0SkzBCp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JKM+lQbB
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdv9N1614467
	for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 11:23:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LCLGT3dGFbYN1moOX5comzCH
	ld4bgy4ncy8r17Egy90=; b=D0SkzBCpnj/p7gIAvgZJWNa4gx96i7m/IaIl34+6
	nDvIVb8O3g28rqcitQCqrjNmvK59YLW3XT+Ivs5gdufNBdyPjIY5MabwR0Aq6PD6
	holb2bkwxif4Dd9qfkphphkYORji9BV0SqQtgsHLXMWe4Phrva4ojg/8F3ID5ix/
	cBm/7O3asPnPiSK8qlzi8ieX40a8E3hbbePq2dmSqKipyetD626oUAQVZlkDSSqh
	JHTwN/1R5LsSS+KViD//rA4rNxhY2QkuUlVlPiysTD23Ht8X5nGRuXJMXvV684aR
	LsM0yBjh5rQvV8LJCMTky6aUAwMuFiLr07/1CARLgyfXww==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqf5rwj7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 11:23:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f6f4fe531so719489085a.0
        for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 04:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793100201; x=1793705001; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LCLGT3dGFbYN1moOX5comzCHld4bgy4ncy8r17Egy90=;
        b=JKM+lQbBCMimTyITmAUUODC+CuPTHnQv4ze7SP1UbEt0dzJHp6UquHwCaxDeAuI8TE
         VMiIxphUvpTsbfQBXrh4I+xFpKwxgOl4ZniJ4hYQt6AaTqijDIsp142mjbVtwZSYTnEP
         AZyDtDg5Z4YWuhpbnGpxB5okhnoVqvUs/DlQhL8iD1qmJZ+ka5VoJzOUQ1eNEA4b5SMK
         t3sfownP24/dID9mOn73avgDWSsKhMS3aJATmb1vycdO5QCC4/ZMwK29b/BlgOmCbKas
         lmnOdbR1O4rUJsbOSedQSRlnn+0upLOHMzl1tqV8A6tL1+lcfqH/4/6xLGqN5KSuPHX3
         SSZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100201; x=1793705001;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LCLGT3dGFbYN1moOX5comzCHld4bgy4ncy8r17Egy90=;
        b=ZwEVCNGD7QlSCe0H5bmynFsqFW2gVe/kNVGu5HzbDWYoyzSuY/ON10za8gOM+Y+iZd
         Fc0MgeaB5l6cZZFYqSaplJMI9HRP5nxud6Wq4jdTJRcLjvwNXxPJBOR6rn6vcJFzUIh9
         Sg0MPf5ooukZWy0vHqrrWa1PLmVmIIc6fJQ3BRbhwNgzAfMS8kXyXtUmCuVCF1xnIwoE
         XoBP35uV6Rqti6QHklgN1JTk4EZlpuu+ciPpk/P/Rz1+HUaXLoROnzLY1UgCPH4krjp5
         LBbCOcV/xKj+c1AM18s6RgfdWkmrp3xQ3ApZHhOcuR1x6YWt7G+c01Ns7nMKobk+wrMq
         zgvA==
X-Forwarded-Encrypted: i=1; AKwUvByKrOibdVeE1jPeN+HHTg7lryKyek0B6pereRJbtkhk0fmjTrLUCZcDMMJLbneVMxug1pZlb5wSjTE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKrs4GS0QVZ5Q9GdkIARz5zEfSNEdTYEkRhPJmBEXTtfzG6ly4g
	XnAv5x0GW5wbaSHwmos+6vjOVpHU7AcT29aFN1G/6STyi7U9FG17+fx86lfY4/v+lKc6dqJldkR
	4lTCNCOdXW08qQML03kiQFNy3lY3lkV+K4raDfTWLTbyvtbKJd/ppGFT9c//mOA8=
X-Gm-Gg: AYBFou3Us2vG2kGHJ8yx2iK1QiRJAL+9Sij75RNN99upwBF/whb5gFacP4HszPl5oR0
	p9bF9KVqjy9vrwElqUoIzZebTEhbx2zm5mlea0bJXyQqgd2TgSJmHzcK2uxTsGZCy0D82nPJuy9
	bZ0GLi43DR20mQL/u90cTyG143labnIvXTskP1/pCfqhe0GSsXt/3C+2FvnGA/185c+QLUjdng3
	PKv/LJdK3/l4ODHdR9iHinfcjxolmXeHS5KBGkRAaAW504otBK3npCoYca+58iooS6NyOrUBooP
	bxzelaqCOnvbbb9cLEo7bAEfUUOk9ZOFq61N1pnPdGx36rSy0/pM5rU/flrX5hh0KFQzlyW43AO
	57xOBs6Ikz4Q3eufN
X-Received: by 2002:a05:620a:198b:b0:914:afc1:c66d with SMTP id af79cd13be357-940ef7b5363mr1437220885a.11.1793100200680;
        Tue, 27 Oct 2026 04:23:20 -0700 (PDT)
X-Received: by 2002:a05:620a:198b:b0:914:afc1:c66d with SMTP id af79cd13be357-940ef7b5363mr1437216385a.11.1793100200094;
        Tue, 27 Oct 2026 04:23:20 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359f59750sm175048735e9.0.2026.10.27.04.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:23:18 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:23:16 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Robert Marko <robimarko@gmail.com>
Cc: andersson@kernel.org, abelvesa@kernel.org, sboyd@kernel.org,
        bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        taniya.das@oss.qualcomm.com, ansuelsmth@gmail.com, john@phrozen.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: ipq8074: Add CMN PLL
Message-ID: <xzlcs4jdxvndta2lmbnofb4dvekkbea3gaodqxjomn6o7ibjif@lakwxrxx2is7>
References: <20261026120920.1667982-1-robimarko@gmail.com>
 <20261026120920.1667982-4-robimarko@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026120920.1667982-4-robimarko@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX71MN+Tiv/Vjd
 Fgm1kfdNtgSIr+tdWWk/3mEJIzMNh5D6BjD9n/2EnZ6vyW4L48zSTQ9elhbywX/Mwx95wd0VBSA
 A2qFhV865FtLNe3gLv6qcGOFShwU750=
X-Proofpoint-ORIG-GUID: vyQDx-kwskQD48PIsz8TTH96ZxTNwU8S
X-Proofpoint-GUID: vyQDx-kwskQD48PIsz8TTH96ZxTNwU8S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX4nCRZwNaV1AI
 dS9JtDRYK6D5ueSHdi4v3W8wwDtx8/SSV7ze4QXc+rB3dUnA5coSoLIhRmmpEudCkZxBOqsk3LJ
 gfV5iZIL7ILMZjRBCwzvjMDaEL/7lKDwTZuLOt8Dw92oDTYN18a76TteD62h/it6yZ9NN3ldIz8
 tw3ihTYzx11Fu+K04zRGMc3Bka9DbWwcaERAWwztSWCICEfdp+j2CSVuDboxdpQ1HkxZz/jrajV
 drLOBn2ceUguWbJKJoeTy1/rG4qjOav7Gy7pTzfSNOsl7uAszBlhR72E4Hzo6V2S5PK7uleoBL4
 cmf+dJaFPDjxhUifJht2TWEeeOO1hwE8uAd4/UC/2M+PQlekHy2JWbA0b5jRV/V/khLLjBV25jb
 ovsQWC684aI+1sDQUlg23MQwn8jztnZnZuY0Cm+uG0hFE+zX3xe5E1Rf5Ks81IJqLMIwt+OYMjz
 nIHqWfWdeWI8wq9LkZg==
X-Authority-Analysis: v=2.4 cv=UOFIjyfy c=1 sm=1 tr=0 ts=6ae089a9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=w-uRcYzalQcvdjeGYpgA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270045

On 26-10-26 13:08:15, Robert Marko wrote:
> Add the CMN PLL node, it will be used to feed the required fixed clocks
> to networking subsystem.
> 
> CMN PLL provides bias_pll_cc and bias_pll_nss_noc to GCC.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
