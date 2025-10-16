Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD252641C6
	for <linux-clk@vger.kernel.org>; Thu, 16 Oct 2025 20:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760646140; cv=none; b=Oq9g5qIsczs/mlLhFayqJ8nFZPatqAggYyVjt9v+RuuJDhT05JeF9vDZO8Pqg7RB5K4B+X9cwazadmeDnb6NvztoNrwH2eiu7SdSVYg3u7S5fgge0f5z6MeoNqcunFGrzp6wNF37l2peiTNCILDtcW9rpw1fqNoiC6yua1EDxqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760646140; c=relaxed/simple;
	bh=/BnkzLG7iF5vjjsEuhMhpnk3gLf1GEWGWf5wGNVMGhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DGhpJkJ2t7EMBDYaKnlZQWzvMcVUNBflPPCODOHjyFKdCxZw4ePb0jn+xoakhKhiGq0gdIg0UtZ4fLY7H1pMgkVjwFO/TSBjZLCYXGjMVt3m3MyNAZndB1EeOgOKKvqCouLAOO/AozyfjF8USfntvLcb7SXG007D+E8gcNuB9pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EQ1Ca7B5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EQ1Ca7B5"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GKLLLW006091
	for <linux-clk@vger.kernel.org>; Thu, 16 Oct 2025 20:22:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=t4XeRTtk1HhmwuJqivoNSUwm
	vc5y3nht6ULpzG7FoOU=; b=EQ1Ca7B5u3ErYhxM5XM/jZbhsVuk/QMCZSm4CVyc
	xvzCG8WsO7+QXMbVhlvWscHFpQepb6mr97s+9iKjaEEr+/0t/HXRNd9xEXXftf22
	tD71PbW0BQKQSzSycxYvagZ6q4t+B037vCE+8K8NL4YqIyQH3CIoPDWgd67c/ZRZ
	IGt754YNOSQsPQCLqSa/pw23WZcU0QrosaE/67i1AuFLUUz44/Jw0e50DW5TQ8eu
	v0nZJShbWqeG3lgcvLkPEXQxenDkMw90Vhe8fgx3hCKfcM8rYFLFp9YWGPSf9nxH
	iuOFoYwooRrICLVHlfLzpQ6axkIXcIyRUPvj0vSfZEDRIg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49s6mwv0af-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 16 Oct 2025 20:22:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8909da7f60aso63441985a.2
        for <linux-clk@vger.kernel.org>; Thu, 16 Oct 2025 13:22:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760646136; x=1761250936;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4XeRTtk1HhmwuJqivoNSUwmvc5y3nht6ULpzG7FoOU=;
        b=uO0IJGf1ymzBgTekZybneqvU071rhKSgdZVCT/XJlvFRHb9Ot3AHERRwmHk4dINCHq
         8vWbMqiJFYRYabDgJnac3tloSitpR9jHmdK4j5eyBaLSY6CpAX6qtjaguBTdbnuNu+ym
         rjm9fAqxCUcba9gmktl7Xn/oFjg/iPlBiZoHCdPRClyQKEKZI8Uu2jsVb57jh1wxdotF
         LjFBWm7Z78+aDNkBjPdYKGk/PiqxepFWP0PzKZIRvjhKVsGrWiTULxp/XcJJpv6p4C3X
         tZkUKbuH8K/8Fsx8jc5CfTTuE98f/bIYKTYpc7ylMqOoe57DV7A421GadVpmCHCVqHca
         whnw==
X-Forwarded-Encrypted: i=1; AJvYcCUb+7qtVPNH5YttBH7CQBcN66EJozcKxtkBNF+I/tAzl/0uPZnv6xKLiVonwXQ4nCSc3QLSLiL2P/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzkRCH3cSR3Vs+Gm2l4YWFeByxfZBj0ml3wCt0//kNzfGrkaN7
	ZzsYNd9szEgFd81pRpuv+9ENEQlBasJua39Hsdcs3Gx6hQhn2hZCy/6I/eJrjGkn8dE/QhdIQq2
	9HX+1360/cHmDSUCMoaHwT0lPSbwnqJu9GlWE1CZbqMSMEQaVs/1k32zOe0s6Cnc=
X-Gm-Gg: ASbGncsqrOdXi8Z6EgOabb8gnjzh2q1qKZcBFp5pT9qEtb+ARQ6sr/K6A4SUlBXN282
	wNCKTVzGdm0sapGffIpGY6kl7FwarEtdZtJvHDB1UcCHmUpVTbVq7AcCsnuD3lvcqHdb92oeOIB
	iwPd/5pqJ2WFghZ91iWvoRtOC7M81/hLJ5Jo6wT3NU95LanuBKx7zW1fA1k15rjLJrfWLQR3jRv
	FoRx3EwQ5KKYy111TOt19R4RlLyk/DR1pvHk7Xz+Z5gS6qCpii+IiafUKU/HpTwel0KBIDCKjwd
	JqwadaFrj7QqU3Qldv0s6jxdePjrDrfxrwoUeaD1ttPmOT50JXrNCYi3KbkZCddBhyKt4jyRoXP
	FIuvdm7yu3NmKUyOaTqqQy4jREdqycPb8q2yv6BZulVCXfZcR2a3PD/XxflIm5cbuCS4CxngjLN
	XcxWzwjHgPldQ=
X-Received: by 2002:a05:622a:1101:b0:4e8:9601:37f5 with SMTP id d75a77b69052e-4e89d05bcd6mr20995711cf.0.1760646136048;
        Thu, 16 Oct 2025 13:22:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrcAdKJUHa7P+g75kVAeMcu1GBVw0vLJXNi7Bmcd+TwVbNriITJu0bKiz1xjIXDkX2pPHaqg==
X-Received: by 2002:a05:622a:1101:b0:4e8:9601:37f5 with SMTP id d75a77b69052e-4e89d05bcd6mr20995271cf.0.1760646135519;
        Thu, 16 Oct 2025 13:22:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881f9148sm7376487e87.44.2025.10.16.13.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 13:22:13 -0700 (PDT)
Date: Thu, 16 Oct 2025 23:22:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Anusha Rao <quic_anusha@quicinc.com>,
        Devi Priya <quic_devipriy@quicinc.com>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Georgi Djakov <djakov@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        netdev@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        quic_pavir@quicinc.com, quic_suruchia@quicinc.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 04/10] clk: qcom: gcc-ipq5424: Enable NSS NoC clocks
 to use icc-clk
Message-ID: <yegaz22k6jpn657tyuiavbchgc2unaoqgvsjn54dzdhnb6rr4s@twg5yrmxx7ot>
References: <20251014-qcom_ipq5424_nsscc-v7-0-081f4956be02@quicinc.com>
 <20251014-qcom_ipq5424_nsscc-v7-4-081f4956be02@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014-qcom_ipq5424_nsscc-v7-4-081f4956be02@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDA4MyBTYWx0ZWRfX5I+To+XuB65L
 9i7Q4CVb6FQhZYkMva4YhT82PV9ShuMtU/K9SOJotu/Hatgg8oA1AIdflHkuRLL/T2ed2K6v+XX
 4zk7SzhEn2sYCK+H16R43eVntB2zBQblTrzsOZioqxqiav6x6aDdEY3qOVrozUmUBWAZcuUxOxk
 5w6ddlTEOgCHZN0y2YvcGYt0mbhjq5nf+HZsrUBRJ9oWk/0taXiYBAeiA1/q5Jtrjt7eeUmhHXz
 GP3sGGQGGNAyJMxn0836q746+kKD2jwJMjl2i+ZUqU6/iHrBKesYZLBZTM+tOOZDLPV3OoDAp1a
 anPr5RHoB5EbWn3Yp1gC45Vvc/V6b6oiIAH1cRkw0vSV64+pNbmC2AP7Em5lmOrKzS2Wli6wyqI
 8TMzexwMRp5UmkFwRm6YJkpbNHahVg==
X-Authority-Analysis: v=2.4 cv=Fr4IPmrq c=1 sm=1 tr=0 ts=68f153f9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=DdE-_dUAR9VioeaCo_UA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 6VxPt4mR61YrzwghKeXtY-9b23ApQhd7
X-Proofpoint-ORIG-GUID: 6VxPt4mR61YrzwghKeXtY-9b23ApQhd7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130083

On Tue, Oct 14, 2025 at 10:35:29PM +0800, Luo Jie wrote:
> Add NSS NoC clocks using the icc-clk framework to create interconnect
> paths. The network subsystem (NSS) can be connected to these NoCs.
> 
> Additionally, add the LPASS CNOC and SNOC nodes to establish the complete
> interconnect path.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---
>  drivers/clk/qcom/gcc-ipq5424.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
