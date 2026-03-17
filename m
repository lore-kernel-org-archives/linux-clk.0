Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE87439D6C9
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 08:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773735647; cv=none; b=q6MgAmS8HYmOPPfO90UtGAyvgLasrajQ7h2uNlwEP0N9ZPJeZldHRQaoYWxQxPh+2MYlNnJeiovke/vnwCjbIU1vP62aJSVSupvh8HA7f840g/0zg2RGVtiQFsVY4N89H+ZIKPM9Jhs7Z+Qxww1aDVvv2Ih/FG5l2yuTqCDPBqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773735647; c=relaxed/simple;
	bh=pvmFIdrJY329RE6bMLG/vNraS0gxmOyJoGyrnKHCVUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uK+yUfNjI7RHVW3DEzYkrYlSnYSnT0zyhXOznxGOjZXs3gxk/lXzuFRstR+Mo+dKsOO+6kcPg4jFWe7RZffaSMVlnvilNWByiOxePmffePpMQUUqPaURC5J54FAG1mLqnClkjn0ezfxHPT4wvvafBjub837tgI4fG92bMgcjEFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WYMSh4gY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L/i53zfd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WYMSh4gY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L/i53zfd"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H7fab31639183
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 08:20:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=q22MAYUqk7atynCYU/o1hplS
	y4gS1yYkMhcE6k+4m24=; b=WYMSh4gY4nzyJNDkWIGNwmCpNCzKOhmbup1WihmJ
	OxtLfiO20vvyw5ylrgIPN7hwSM851kBvdOida0PFAgIYziQbncZznCr2762dNlhU
	j/dYsEUBxnhcOKvfxifoHL9FLQ2zH77rwqyRObntJb+eeV8pZJ6ci9ySTQE4bmJ7
	RBWplc1lIIMT5qYVQtmwM8iVdOoHsydeFVEecWiOm36n/JWlZckgvQGKQRXki90Y
	LJsiq9Fylq+/xxTMYJFKyrUXZKEDjzeLLLiFA2gMGgpGsqgIDet7ShDnjo3d4FUe
	2KAckR9Noig2yrP61AhMk4c9uarQbrLaKkaJLSioKiN7hw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxke0bafb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 08:20:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd722c1a69so321038285a.0
        for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 01:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773735644; x=1774340444; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q22MAYUqk7atynCYU/o1hplSy4gS1yYkMhcE6k+4m24=;
        b=L/i53zfdShCB5NYUvFcLfKYtulaStJO1YGYeOYpZx7xf9rQe1t6obgJGUWCcN4z0cP
         //lD+TJLpYSGeBBzHxewz/023zqd8J4/ezWgJ1RCqP4j8QeZ4LNbWKf++PKiz5IgnLGq
         feDH1ysZOtBLyuSZ7Z+jLMLc2/34N9tBeAUzbU+CTq3K+s+Dt6jMrQjDu4+cw/HCtrFM
         NzGQM8ILNIQqgfrBU5i+QegOXOHzfO8N4XulfQhdgw46VFlL0CRfspKKUVS2fHgBInba
         rFe3nPulz4vgWqu1ObuZLg+JHbzGLtA1pIlJYymDxwblOeEAYuCXU7fbElXkAnaUi7pe
         TcnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773735644; x=1774340444;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q22MAYUqk7atynCYU/o1hplSy4gS1yYkMhcE6k+4m24=;
        b=arSkN9YBjlGdnjutd5GFlEz4uoZFYC2sYKAQkbw+gAkgCGvwlwguHwkdZAmDYnWKlg
         WrB6Sj23IaMI/S2C31ye7LcRh2+kjXoDUvk0axWjQi8lg9QUKJFPpFujdRvGv+1enL9w
         x1WU8+LBa5VLzOuMYC6eQaTrvlIWNg2YdMDINzuym0r8VSzsNyghhgbFoDXnS9EYB3cD
         /QPVzj5Xq3ZmPIkENfiKWmoiRv/RF+9s2Ts30pgB5e+Zg1LyWs0rCrqdSu2Ljp7APZ4w
         U20lHBj46ySrhwhR6qS8N6yZE36W5yA3rJwSeTQa3EstR7cqHBMzsWLbl83Pft0ywuVc
         h+kA==
X-Forwarded-Encrypted: i=1; AJvYcCW0G2j1+NcAM0lqaGSlddWFI/3kgsbbTWxc6vy8I8Zt59rW3NhUOLzshO1xuAFQgZ+U2XuHVq1Dlv0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk1JtDLfQgAwb0dlrd+XxhEyPxvojLAr7zCjTknQU+vz/GD7od
	VC+aaQlAkHBOMmn8w84m/t/3Z/mQbAAhOuF+OvoMYXe8Uz5C3CPP0h3Prhnk5NJtJTFy6H/QYba
	LRERPOsqNCqS9/4/mQfo0veL0ro4yWKAIeachHSuC/IOuGG0eUMWmBYz+J4cM1GI=
X-Gm-Gg: ATEYQzwxPjqAfrVYrHxoORV/kzr0obk9QyWr39w5ROnkvHooE16ny5WEj2Y8Rj1ydZa
	GGUthMSomOgizD2SNTJn2d5a4N0wmnG+CEdFwXyB3R0nYROlIE9JWYF4k65jE5L3m2DuBoJsEtf
	h9s26SzOEhHupkudI5TI2d5wsS0OZal3GxKt5XgiusDcDm3dL8NGZfzH1WXYp1IZcaqKVg5P1yR
	W9VvPuBQOPgn2MQ4pVYTQCcHosKmeHQS4Cw8cLJpNYVHfNtrtc3nQuuFd692un3vm5wVEyNUzOt
	qlNo3L0gXxf2dLHkfwZpuZbW4TbqX80UTQisiRk+gtj1vIshQwVwbNcLWcmSBG72MvcsaR0c4Rj
	ge5FIPbr6t+Xanl3pjxdxm8yXCFFTB4I8Jw==
X-Received: by 2002:a05:620a:19a1:b0:8cd:80f1:f460 with SMTP id af79cd13be357-8cdb5b20e52mr2244390585a.45.1773735644080;
        Tue, 17 Mar 2026 01:20:44 -0700 (PDT)
X-Received: by 2002:a05:620a:19a1:b0:8cd:80f1:f460 with SMTP id af79cd13be357-8cdb5b20e52mr2244387385a.45.1773735643531;
        Tue, 17 Mar 2026 01:20:43 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856eae3037sm51077145e9.11.2026.03.17.01.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 01:20:42 -0700 (PDT)
Date: Tue, 17 Mar 2026 10:20:40 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux@ew.tq-group.com,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 1/6] clk: imx: fracn-gppll: Add 333.333333 MHz support
Message-ID: <sd6iwi57nfv7whvlzlnl74wgel4ka6zs7mc2imafhtgpeail3r@dotylxqzpr62>
References: <20260313070740.585043-1-alexander.stein@ew.tq-group.com>
 <20260313070740.585043-2-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313070740.585043-2-alexander.stein@ew.tq-group.com>
X-Proofpoint-ORIG-GUID: gTaiYfHiaiXTkNUt68cm15cFzhB5i8wt
X-Authority-Analysis: v=2.4 cv=aue/yCZV c=1 sm=1 tr=0 ts=69b90edd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=8f9FM25-AAAA:8 a=EUspDBNiAAAA:8 a=LywSNKSTaWSAk7vVM4cA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=uSNRK0Bqq4PXrUp6LDpb:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA3MiBTYWx0ZWRfX0L3aw6cpY32K
 pRtshcZEw+BaER9kquDpdCidqW8uLCUKreLn9SHrHEuREBXMotCh5juWZAwn4tTBJ3iQYySekIp
 fgA/7USTPVpAW7mWXj3hJQ6r0kZRhD9dsXVNqcJwdQpJWS5C6qcGEitmgQs8PUcnMyTzqPyHz5c
 zlwjD+W/irheaEHYb/DH5mBm+7CYIEwjbA5In7vtbjh1bE0GZpGSd6CnPojbGHpaZiU56T5BNVj
 A5nVtn67oZLFPApbRoStILKTMbHJ5g06Ky4RVZcQ+LYFr3KMTX1l/LchNSlOKWPZov8+COsj2/P
 dJotF0E6Teh9aUOjK+Todzu0WhPGdO4A1G3CcafNVk+A/f8W4BV4OHtst2CXpM+r7YNlH1xzlkU
 lrrG3ZNd4PtIf8kTGrF1G5xCpCjdlL3HgHwGFMEjkxJPlNmTmhAEWlntPxI1oKvwU0Wi6DUOVdh
 DPBnaeUHw7pe243OFCQ==
X-Proofpoint-GUID: gTaiYfHiaiXTkNUt68cm15cFzhB5i8wt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170072

On 26-03-13 08:07:31, Alexander Stein wrote:
> Some parallel panels have a pixelclk of 33.30 MHz. Add support for
> 333.333333 MHz so a by 10 divider can be used to derive the exact pixelclk.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
