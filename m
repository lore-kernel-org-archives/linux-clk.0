Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098757;
	b=eidnOTsNFQmREMWXq0ZAIf3s+n7lH6GMPammJo6S7qSQc535wQ7yJgUR598BN+UM3an+
	 chNG7UGnFV/wBv61BGeoyD7Ngyl95kPc0kiM31GN3bzkERT+bxa4xEV1ZD/1QsEPVhXYA
	 WjwlplLPU3dcr5Yo8n34ytHMINfKDs5p8m1rLoBDZOa5ok9Q2WIlpjh+wm7mSHVXxOSyf
	 9tAq67G2lq42YmYmnx6Fa4Lbc7XS3qoFfeN1Y4+9O6qrev+I73ey57HCwu5DgQ1TUCwma
	 KMoU9J/OEmRISq7ik+qab9AOm0NJjS0o2Giy2ZxVbNs3GYX2VwYY9k5oCPz4Gm319HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098757;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=k9sribCAPn1TvRcyAr4unCppr0dTL3yEaXFx3Qc1128=;
	b=Sb9WEoNzxhvuKOqctge7PnfbAv7JYEsn2Wu0/zH+RJlDPXy4k2vx1KXJBptorDS/qAG7
	 H/mOZdkSarcmRIOU6DNUuXeEluDzuC7PwrWTf6+J6nX/qvVsC7+ODnLnRvYPhIu7bkjNp
	 aEthNGPG+kK13t6tiNT5oPKnXfDm7Ng9oQD8mtsNliVGyLNP5p56Q04Jh2IfG5Ejmo8UY
	 WSvqC5IVsxBpS+cSH5yt/YxfGX4hEBWlqfPLmmnm9qMeI50fMiJ5vsY9UAK50wK/Mmfa5
	 zxnyxxSKnaQIqx7dpD2Op7Jp+MKZlr3oNl5ll0YQvSkC2QZUD7Xy+uKTwSb1kQoedEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g2NsaQRe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RWOcz0YC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3642E606A31F
	for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 10:59:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3642E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g2NsaQRe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RWOcz0YC
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe3HX432382
	for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 10:59:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k9sribCAPn1TvRcyAr4unCppr0dTL3yEaXFx3Qc1128=; b=g2NsaQReJ36rM/Hw
	ANtKXnFgPvPjpLlr1QmogjS42TTmdSuN5EMeyL4OMzU1NqjBitT0xlH1SYJUO8gs
	rY/P+vC15kNgOHSXXkigaUL+sWgqFwFtNLoG+KzKeal1HYp9Ar7kR+xksi9atzNN
	2krbgZUxVuLT8z9RZ4kv/FzEb1kL9QoTvu8DciIqEvVZB6Is8zLJkODgwn7lxNj9
	ei50p2n9LxI+s3TE3IstWDSg3lTBBuh3K/G/yaHUDJxw0FCganS8N+c/HWno3nE3
	amgBCr5HTRqhEiDmjMAIzIytndhN5fF50tWADHyiC6Og5O5yaPSPosAIaOAfvoEG
	qOhSOg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjb54ke4e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 10:59:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2bdebfc5so119559985a.1
        for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 03:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793098755; x=1793703555; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k9sribCAPn1TvRcyAr4unCppr0dTL3yEaXFx3Qc1128=;
        b=RWOcz0YCAQ5klaOesGNOW8t3k/YC98NFY4jWZ1cQ8PA9um8fx3MhAVSv6T6Q9WjEV4
         r4QX59QSBJs0jcGEe/8iCJQPDyAFNDN8s3P4c2w+Wg0UHCSGtqUfRdcaSFMa9wfxNEZ5
         AOHFZ2lMd9uOwvGfg2+cyvdSufnogMYAk/LW2lkV7JmImW4cn6yj3cSIA4jAm/8sjI7O
         lwM5T0rqrENnjZl18E4RgEEmf4U9T/IRwk6YSruS0Qjx5BbI2A0MuZXpcH/9d3GJyIoH
         0XOTDxJE600/sW8WX7D39pBu7eqRsiqZb4Pd0N+LSRpinH7S5HHHS274uuNZb/6E1pEA
         Prjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098755; x=1793703555;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k9sribCAPn1TvRcyAr4unCppr0dTL3yEaXFx3Qc1128=;
        b=uAip76e+iOv7tT/v7mOznP13eTqnATSt/VJBxSqoczZ9r4zrrlUZ59+5tBN/robPAr
         rGY/6gnotteA+MvgV7HeN8ClebS6M7jZ1Xn8UbUa+HSsob85YXk0yw1VWZkRo2hQcf+C
         itzSI0OWbC2cGBLcxuGxBBJlFrjEUrbrS0zSfwwaWa6s0QmiYAxMPrg0SXdGoF+hcwy0
         hPPyY98pQ1FNnCkQ9fcpkGxVgiNlFHzs+edAMPvsiH22ZTAdwF0hHg6OQkDMfVuONy31
         9O19R5Hydofuw8UA/r2G/8VY1rSyyByX7KHFgaZ1LNpbwkWRFnHZkAeN76oUo6xXAfPv
         z9Ew==
X-Forwarded-Encrypted: i=1; AKwUvBwBmpnBx5TuSmMdt3NrAeZj9/tt8zjipEL7y1X3PlRrM3p7yZSls1YfTYGxQmua7hAr+CFGKay86ps=@vger.kernel.org
X-Gm-Message-State: AFq9FYJu8VUmTC0jOu9pwdOK4dUAzHfatKcuJpVvwbozFVo/00pTwNGH
	OjJvam0k3h4UNtqHNcIMKGKvdlPZV8ay55F8ntUNnn4qO3oC7pa+qXDSccbyLwg4t5KyO1Dgeod
	EcynvyGOEubRxg92W43SxqE4qWAirUB/5Kf6DlPNeCAu7a2ll2qCN3mRH7BOKXGs=
X-Gm-Gg: AYBFou2qc16S94V1VD3OCO6j6AeDS1LQiIgK+OB43W3aDs8PF11oMS8uAfSHOfUxJcF
	LgRikU6yMls8sEbRP/de/DszE8R4FwB0PkGKm78h1jIOPPHzOoMQpwQPeo7h5+W+L+KyKJxQX4L
	J//pEeUSEZOghmSh+eG3wvYX6lvTHYrl0qoBjVQ/PPGz9QhBtQ+Ufj5a07bNN7gRMTl432v58tB
	cchqNQlHryDTYn79kxNs2ShUme+v8cFhhxmbX1Jmi3/fYECXkjmfm2y3LKc8JqNCjmmovQ/8K3o
	ly/8rtFPzVupsZxhVTljBC1XhAd7ma+UcH95L2/rwixyrJZxC83PL7y3A0krW7c99FwbB/9tKe5
	7V84hhODDCNTNlXzwRR5drg==
X-Received: by 2002:a05:620a:57d1:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-940ef915dc2mr1731206885a.4.1793098755385;
        Tue, 27 Oct 2026 03:59:15 -0700 (PDT)
X-Received: by 2002:a05:620a:57d1:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-940ef915dc2mr1731203185a.4.1793098754937;
        Tue, 27 Oct 2026 03:59:14 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7bbdc6sm431186966b.87.2026.10.27.03.59.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 03:59:14 -0700 (PDT)
Message-ID: <3351a7c6-6dee-403d-a8be-57714397144c@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 11:59:11 +0100
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] clk: qcom: gcc-ipq8074: Align CMN PLL inputs with
 binding
To: Robert Marko <robimarko@gmail.com>, andersson@kernel.org,
        abelvesa@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org,
        taniya.das@oss.qualcomm.com, ansuelsmth@gmail.com, john@phrozen.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261026120920.1667982-1-robimarko@gmail.com>
 <20261026120920.1667982-3-robimarko@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261026120920.1667982-3-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfX6b1iSHYiJYvZ
 u/KpW8WxYLPSbaLDa9H3gOt4suUryC/f3V1BFUrLL1FO/UFFtOloKZXetJAfMafgCCyuFYJv+vz
 5IYhg/KDiaTwTHVqqxB7v/2vNZThnOo=
X-Authority-Analysis: v=2.4 cv=bsnZl0ai c=1 sm=1 tr=0 ts=6ae08404 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=oPNFLItuUPTHsqlAT3AA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: -RLNtVKwpYJrXApp1m4zLrbsoCc8MgSN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfX5J2zjja5Dez6
 S8CHYTQJoYHjQMQoTzJSw/LuE9xoQmQOmmkkusNyU/cSeF2qZYCWDfdK7p/mC/n9NQ3lPWxEp7O
 +vMR/8uMLteXmAtQ/Ve+Rm3NHH8H3YxTfxWY4uUgzUIGZnuyGUdbIs+ApKAt6ompsaz0sImXbhY
 r7ViVuq0FvSfFxoskzbMxwEk+UrkjwUB6bzozLQzQyD7BcFlChDH1Lf6W2tm/G2A2Q5QPLLVdDd
 30Fzr8BZDl6Jpg9OBsEbAN7uamVuA8rrkZJQyZmKKuTYii6iWLFmGD3lvh3F2VQBtz3RWLDoN5O
 8ivDOLvZab6IOatY9e+bKdpCH9VVQQ7/00RVbmxTsGd7LK3u6gKKQy+4IM1zXbTSr4ttmyGYGqg
 ktR+VSBwSpatImNtlZZOluQY8lvH7kleD0aUMlWEBdWzKQBa9pnKqjpUQKO2rUuTzA0YkmeXY8D
 XZAuVQEmsJkUi4JPTJA==
X-Proofpoint-GUID: -RLNtVKwpYJrXApp1m4zLrbsoCc8MgSN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270043

On 10/26/26 1:08 PM, Robert Marko wrote:
> The GCC binding names the CMN PLL inputs bias_pll_cc and
> bias_pll_nss_noc. Use those names as fw_name so GCC resolves the
> clocks through DT references.
> 
> Keep the existing .name values as fallbacks for older device trees
> without these optional inputs.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
