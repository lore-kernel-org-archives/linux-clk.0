Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170231;
	b=3ExXCsphL43UjaMGZ5c2Ldb19QacS70IpzSoVe3ChZ0xZGAPYHREg4sloWQa2Zd2Mw1q
	 JWVVVQb6ALueQ6JRLD+WzAO332t24JUGJGmCeEk3N9DN8/kKk/agGDvreA5T+M/drcQXt
	 zP7iL870dTL7IMsXQzmCtz/qHPiRLDMpjiF0QB4erkFYL1BTNby9Ko//JUi++Lxbrt+ZV
	 YkfhaH8+gR2YySAe0kTTgCnW90CLWpnIN04W/tML8eo/3X3PMg787O0wpo88XGfrDyz6/
	 nXnR2pAS6j9xBLAYLD86smew7pUcJhGgmY+ExQ3fYhevHH0Y6x9ha8teSeGNWWkYb0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170231;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8TcUmke74uRIjwI8jkOaFTKaZBFJu17S8g+x0u6+YBA=;
	b=02ka7P6ArDHE9tU7lf8tUNMc6Pl8lqm+RErxyB37z3aCf4ZUGDEPW+hZCoZmfZxojyRt
	 BJk/jj/SnhkRF264zvpplbD8JS2yRt8KJuHzOSpI0HaTieYhVtBZWZgYm4rEvYqOZULQa
	 9XjFgOPv3ZsO/s7nk041ud5/6vF9rFRwOAXOLF8pXx+ElmxCXxkz0dez+aNb9HHfi/fW/
	 KK8c9On1sYFJvZhnW/pfcT/HzPWPlU5gcQ/Cd+TwtbVt3mziB73aXx4nOPHLsMA1bSq4+
	 KiGve5o3DqpvT7/tlBXaB+KVD2IwiyimnYQRNMl3HeMPG3SKQh+KGXB3V9LFSlQ6RMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fUjJhogu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DvAiTvQQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230F8606A32A
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 10:23:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 230F8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fUjJhogu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DvAiTvQQ
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7frZj2695564
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 10:23:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8TcUmke74uRIjwI8jkOaFTKa
	ZBFJu17S8g+x0u6+YBA=; b=fUjJhogutELs2uVD7hnzyFBThyKIi0WEy+eTSFcR
	cX811Sw3p+NmQjf3221rW1b1mqT/vLupUqlV1+tZNiXSDv+nOEZm7lTfeCz1vvnt
	Moc586UGO2NbfG+Yc+bHNnrmL6HjIrhVH45lqGATN1zNQ9/3ug8j/N/ID+nLlTnc
	oUcI2EKojh+n/X36HL+8MenRFmhRxsI6nhWW9926PIrcJeh90s0N0VYzNrTQuvnO
	5r3yrJLN8CBdWxBmyJQI0IwGho5cqXZkbRKazYaQN/tGdx4i022WxwZll4KFh0rM
	wDNl+Y1doBoMLQpJysXkYpU6mp5E8PiafBGlLYQtImgHVg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27au36v0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 10:23:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f5844cb60so141723185a.0
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 02:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795170229; x=1795775029; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8TcUmke74uRIjwI8jkOaFTKaZBFJu17S8g+x0u6+YBA=;
        b=DvAiTvQQ8Rck6OpoqHVsHQKyFrZsIDOaG0lE6t1v9pYEoRg7g3CsYLWbBOqvgX1Iqn
         HvDDtJAiCbXSQFzk+IzAA7PNArtqs/oVz8ftMo7vebwnpLTOXvKtX/72fianSv+P2uyQ
         hxD26mPz7aWu/fEN4Tdq1Wfpvo5Ze4iXPeBFxDBEPARX0GqmsqIbYFHPJw0J/Jed254z
         cVr3oKBQeC82FmjnL4GITmvPQREM5lcWDuSIYr/IITUDhW++mMEVLi5HDZ+RFgsle9sg
         QCDrH7sYx/PiqaNslADuR07sXI1tFE0KAFNnFqzYJKm5qH6zmSkCg8/mVEs2IU6YMDpM
         xbJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795170229; x=1795775029;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8TcUmke74uRIjwI8jkOaFTKaZBFJu17S8g+x0u6+YBA=;
        b=tcxI+UbIGAHbA8zqDsMGPMBOkeTu5QZ82Zlk5nPjtFg12tL4gNRPcdSzxc9DLXI/y6
         m1rOv8/Yrw74Ux0Kx5wwey7ZnmS3sI6whhugPCnDIMtX6tOU9LPj5t9MvkIKGAjiwgG0
         2AvzjGYHyUdvZ4r6Gq/pgF9G2e9PVZxYxwVJupd8WErDxSevfeRQJri5AeKKO8vIkCwb
         B7iKaLRMhR3c6RjRsHcSY2v1jaBBB6S2Bb0P3MBJ6h3tZV3vNmImMnReksZx074cXBpB
         GOeTnqdeJVQhVSHznrDQjnKIUPVj5I77S6vBXuJ/C6hcLUblv6VPBizvh5YRouTj2TZF
         un+A==
X-Forwarded-Encrypted: i=1; AL+hErFn7Xo+z/CFGEpACZ783bE/X2kS9D7hU0/Pz139rEkf1g7DWNlwxIZBO3xNYH6PUFt2Sy9S05faPuE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+b9s6HhXuhmpxfilM0GkfHkBsHRnWRUm4ozqGlTc/lBVditI30
	PXrjBs39USLwJEKcxnbYJGHG2XOjoPUfKISK3/Xu614XqYi/8+CMSw9251Vr7SfdcQv4odqAr00
	CM/bnfzInh4ETi2oHW9qyK9llPLAIeD+bZ3ea5vhcu52hK9HgczeWbZ+oaq48f8M=
X-Gm-Gg: AYBFou1l7rvziAQpyDYEtuXRD7NjMcihtVyKokvp9sAKMYdkgLiJLwg6vYcY2JH67bs
	LO9G0I5mJf1fzMdeXtpvJwL9PXjeD92dqaZinYnC2uh2awQ0Awc7l3NcuwjRw/RGVHYBM5CFFNV
	gzbcJ+3j/gGCXlZm6rG/gLM1GY5OLTISY+bY13FovB1hN1FocL3CQmLBlEWvXZaFU4t16Xp6ivE
	lunwjF7zQJJZLYCqhYkgujhexfZ9/S2vbUGyxCpcZF0wXHpvoasVR81jvi/9arLC9VMTr9mPY9j
	rAOTV6WbhHE0np45dqpecN7Fzj+tSc6eMS8wWr+6YdpRQKH8KmjIiaWFIFwdzHxOSQS19UnvCs2
	7ZjpS6tzsiv2kqGqshdrfLNhi5/V8AX+mNrk/BzAlQccipCLdD2awm1pABYvd2PAS
X-Received: by 2002:a05:620a:4085:b0:93c:d209:4ea1 with SMTP id af79cd13be357-949b35cf4ccmr548458685a.24.1795170229017;
        Fri, 20 Nov 2026 02:23:49 -0800 (PST)
X-Received: by 2002:a05:620a:4085:b0:93c:d209:4ea1 with SMTP id af79cd13be357-949b35cf4ccmr548456785a.24.1795170228426;
        Fri, 20 Nov 2026 02:23:48 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm4698002f8f.3.2026.11.20.02.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:23:47 -0800 (PST)
Date: Fri, 20 Nov 2026 12:23:46 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: gcc-shikra: add PWM XO512 source clock
Message-ID: <dtjei3tsuc37fzaxokznqtxxmkbuk3h6dn3yxnqcru7hggkuuu@igwaugqrjxfd>
References: <20261116-pwm_clocks_shikra-v1-0-55fc11501821@oss.qualcomm.com>
 <20261116-pwm_clocks_shikra-v1-2-55fc11501821@oss.qualcomm.com>
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
In-Reply-To: <20261116-pwm_clocks_shikra-v1-2-55fc11501821@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MSBTYWx0ZWRfXw1W4uboLmV1e
 IRcreU8BBGT4WmWsMxQw4seU6CMBO9LQv+hCSPtkfP4ZqA6Zp15tlwHHrliL44yD03Pr9CLCApI
 5yaWnyxcQsEv9YBNPLxu1PafedqEKdVlgPcvnEtgQRsG2UIi+EloIv2k1bvtb1VyY1IuLLZH9eA
 DZkpV2N6JJuortxIZckQGasxLDLYvuw2pyngFRUurZhv8f/VI8Te4wWhygS9L1VGwU3j2QmEIKf
 biHd6OLfUpmghPY0M2gM89Kmz6snXIau8BaFkDqRJ8QYIyO2BBkbxAGzZQoTZXDiTRtFL/F0ftV
 7G/xKcoK+TibKszGnSjTpCAd9LiIcrQCvfwDNWqnxXUDtMlezZwty5LQ/kGTK4sLpgicjhAdS2L
 vGRPaWVAR16rzhhYsOXCkfwDLkR8VcDcndhnQCnK7lGqva23axVvZtqBd/os8vFvigAdqIhRri/
 MAKn9VzHfMhDRLLyiOA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MSBTYWx0ZWRfX1dMaGk4EQKTr
 ps+Cr3C4imbuP7IeGYEtFT8F2T1YZmvL5NWgSwNIwMUk7zDcQ3mgUA9vpIwomLmn5/U6re99AoC
 C2ymWVxCOmp6cYWDps2/Hw+Fo/vVte0=
X-Proofpoint-ORIG-GUID: 7mxNWdOH86DsnzpJNAjbp7xLegfq-ja6
X-Proofpoint-GUID: 7mxNWdOH86DsnzpJNAjbp7xLegfq-ja6
X-Authority-Analysis: v=2.4 cv=KuHYSmWN c=1 sm=1 tr=0 ts=6b001fb6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=qo5-9WyrHJ9SuE11QxkA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200041

On 26-11-16 10:57:45, Taniya Das wrote:
> Add the programmable PWM XO512 divider sourced from bi_tcxo and make
> GCC_PWM0_XO512_CLK its child. This permits PWM consumers to select their
> PWM core rate through the common clock framework.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
