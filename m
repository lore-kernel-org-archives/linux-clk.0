Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD08235C01
	for <linux-clk@vger.kernel.org>; Wed, 14 May 2025 21:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747257835; cv=none; b=lNzvmQVasOLBSzILZNd1Pml//5HHeU63liPbeVEuQ4/64ai3rpYqgreSYqu9UCHgi5ZaXSeHWbcdjHvUkMR3t7iVXJrHIkgILzCTp13mHfCpe++ZebpL29ZfdhGRsZqOKcStdIlnGPUjuXGhSibg9dWaci49ihWIAB4UjcdKX3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747257835; c=relaxed/simple;
	bh=7pH57kK3Xt/csRgr21H64G5Du+sG79Jaz8WQJncHCHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nb8ClxKL20WdK5iigip3MPjMYS+dMusjPTxv7owvjthIMimqM5RnjHOXrhd445sWre1yPHTNvlmNnCjfjeA1CFE/fl9JdGbtEM0sMc5BfcaK2FcYZZGEuI6OAgGe7986DhAgW3Yl/pEm8yPnzZBNJIFmWcPTud7pNaJpsnyT6fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cQ6Qlifw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cQ6Qlifw"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EJFSO4002724
	for <linux-clk@vger.kernel.org>; Wed, 14 May 2025 21:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cCO7ZLjC2zRcvoyTH09XsMKd
	bgJeYbUHpzeM6fhi2xU=; b=cQ6QlifwB7yASKlwLhMCDOgZR7Qj/m7rHDy1/bow
	VaMRzQI+S6TmdXBq2zbqYR8zeLGjXzuhi0BLKyVjmSPGEZD6NYIaPJ5p5KKVXUp9
	KI+LeNyDJEEUQszQIAsWr8XZbsVAQoW9HO13SvnGskTsQXBejl47IlAeNfPCXual
	c7UApFHgxmyk2znVHYxYVc4PSErYZ9ymct+T1EMAW+JrHuFivwUiTPKM2EPmkDrK
	HhSwg4TnfRsgvvLWQat0NC1LY2u8jP6GzheA+tG4Ke6cVe2BPhksIQ0ILlCCvk7B
	asp5M+ax+/+0lGhOkziLSWpEvWJXEA+V4KNks4hcwtk5wA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcpc4kk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 14 May 2025 21:23:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7caef20a528so48955585a.0
        for <linux-clk@vger.kernel.org>; Wed, 14 May 2025 14:23:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747257831; x=1747862631;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cCO7ZLjC2zRcvoyTH09XsMKdbgJeYbUHpzeM6fhi2xU=;
        b=osoYkppbuY0gbVB7ktR43O2z2QowYcrcVm6r5X3M0znSwqMboxR5H9OAxSXXMnxyRo
         NobzbEfc1rXiqSzdbu3li3y6jw3MD8rOqAXKgxbriybcQIQeeUq45ZQ9CwcDB6dPG/ZH
         JLemBY5gSzbqQPc74Ibme0HTHPGEN2R61y0aetiRoOJfi5kvD5kufsFz+47Iy+bT/nZr
         W5XXFW06t+agF1HejlxPkI6mkJhiKwpXdD2uczfEGtt5bB3gCFRrceDZHlOpcvBj4vuB
         aEvpc4yPKy3JEvXALW3HNaWcP0sHiGSpQlQFcU6xcVd+avkwTFzYKPuo/0PfHPq/nTcp
         i9kQ==
X-Forwarded-Encrypted: i=1; AJvYcCVogQBVC66ZVuq40fnrLKI9AdQomeYGX4YRBFXsjUfNe4cCXU/TP3wzdRUARDSED9bhJvTi3rJW9uM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmYPif7kYZhoZ4cTaCiRBXoZwhDYaOT0jD51Ia8nD6sSPRcB12
	lTEqm7rHyFEhrCFiRJkQVyKK2evvCez6cLyleSJ7OyIdsTqZ1Alw20RSDCMweGUiFzFCRSb8SI6
	fDox7HV1IbB9aZfTq0lw26sD+dCjVmqy3OnmV5+bsizN4lsC77RjW43zOgcg=
X-Gm-Gg: ASbGncvEdwAG/e/wRHn3qw2pSpAONjHUhLVYAANQiUHKvGYw+6JkGA6w9Il6vxKf89s
	NBiaHA/ftegq7xAnhUbdTB/CNQppVQ/f+gj5pBk1jlqM3PJXr/3pgYlYWGmYeNTqah3MMK+8mkT
	QPEJ8Jki1Ngl1qe7mWtDU4vTYq5ubUv77u4QRQUa45Q8JraXHOeSKyGsj802cnnmmU9ncRSMZLg
	0VizTx09SseKeiFDPGUsxKc0xw0K2kTsyclwdvhpj684ZX6iNHRI/kh3ziHExfbDQw96lgvgqBj
	Eu5Nftt2iObC1f0bCFIrMgMflvSJVj8Fbn3IaO/QPdXg7xPFrL32ZAUZ4XWf85146pjoDUkp2xg
	=
X-Received: by 2002:a05:620a:31a2:b0:7c5:994a:7f62 with SMTP id af79cd13be357-7cd2884730amr684239485a.41.1747257831542;
        Wed, 14 May 2025 14:23:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzrBQbPnoKVl7bHQ0qQGVk2ZFKEoO/D0xKVkhPDkIPzUXUVOhZMKskuU22tP/6q2an1SNjNA==
X-Received: by 2002:a05:620a:31a2:b0:7c5:994a:7f62 with SMTP id af79cd13be357-7cd2884730amr684236985a.41.1747257831256;
        Wed, 14 May 2025 14:23:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc644fd0esm2387959e87.6.2025.05.14.14.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 14:23:50 -0700 (PDT)
Date: Thu, 15 May 2025 00:23:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v4 18/18] arm64: dts: qcom: sm8650: Additionally manage
 MXC power domain in camcc
Message-ID: <mffphqhgr2uugrahumcvb3g5swqxno3gi5b45z5qnrbvzncyrn@arz725xwg463>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-18-571c63297d01@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-18-571c63297d01@quicinc.com>
X-Proofpoint-GUID: CQpmHLRFZpKjY7RDm_OTot6Y3L7K2_ap
X-Proofpoint-ORIG-GUID: CQpmHLRFZpKjY7RDm_OTot6Y3L7K2_ap
X-Authority-Analysis: v=2.4 cv=cO7gskeN c=1 sm=1 tr=0 ts=682509e8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=l4YKJxAlfa9iYSc-yQoA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE5NyBTYWx0ZWRfX/U0ljf5hwh2B
 SQcIkNvQo37AALVXKZ/gmutCce8jtFbVpHh0J2IOCqSJuwmyGiEz2monVRwXVZBbf+ljn+RIafa
 rNLY99Fi2oxqq87fxDMmZtS60rvsVw7MKF0rMrGNjoA+Y+ep25XxBDEDHe0MzvXFULR7OVJ7BRQ
 SfsQ1yJ/nPtKTBb0P689RmXGduN3HF6dXZsAt+vNMpSIT/NAWLOEQ/fHy/oL7ZXlOTo4zwYoZhP
 Fx9BKqFzO1mLvQILyAaMszWlNzBlsIXsDU4WrBY/iWsD/fpB0h0m4J344wRq6PutM+IEXzQWKSs
 gwN5VRk2oC8bKv4ee9w89pww7+f6ZuzfMPPTTFbrj150XlGxIjOkj8rr7WI9j0NZ6O/Sx+K/hpz
 rYdpMF9Ds4B0pvtifUZyB/K9oGzn+x6PqfZX0g2CMtZl+Hj2RXgyi5IWr7m6plk9xwhHeiuU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=553 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140197

On Thu, May 15, 2025 at 12:39:03AM +0530, Jagadeesh Kona wrote:
> Camcc requires both MMCX and MXC rails to be powered ON to configure
> the camera PLLs on SM8650 platform. Hence add MXC power domain to
> camcc node on SM8650.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
