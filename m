Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201966;
	b=fC89TMB2tdUhHkGXWm6NCGL6aBU/MrlmzCqVcM0kcLESgFbRgyNPyxxVRe75TKot7imR
	 Blnyl6dPQOsAaYUjUxqNPTVd84DbMcop7egdGijbKwg0jcq9QJsoRHjz7e523UwEuKfhr
	 nmZjGKFtn7ofQcq1n2WEzlskL310nKNQ/9bOXICJAalHXGkE5CoaRO21husW9fHB9vemn
	 t6Jn0rBLAvHyblSrLt+gAguFWyFUD9qTmyHupDz4xxEnkPh3vwbJYQoPbShQPHEVbgb3v
	 6+7rHeGnFRTqv1Z5+2aDPX+K2FbSUgk8M3pWgz7xQYmUEV5788ATER8YWWjNC1BNMtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201966;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lZeWqgO+2lHgeB2G3uZ2RGo97UeDvnaxq8shefBQPMQ=;
	b=pE0WGSePcvRxuySsl0XMYn4Fvx7uundGAauDVRyA+28H89V5Vu0gt5Nm5Kja8dLch5rV
	 mEM8gABwoN37jJl+fYDuobFGGJckdLBzjfjIvSxqOnyPFGFBkMpJXlqf9FmdPYovrBvM3
	 GMjS1CUqA0xotJ6tNDKSwS8LVb0r7R+nNj6preT3roaiNL9Hv871AUaNoIU9SQHe6XjK0
	 Ubv0Xq1ECvBX9htJ1Lyu7QA7KlOuP5Y6Uu2PXBXKoOgEcdxklyT527EwfgzB1Gjk+uE4Q
	 q3je2TlUHqUtWN/sldN2eY97b0RLLJnjnohiBC9Gfb9bJDuaaWdRLknHLdaBD4w9wFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b4gG80mw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JpmSsnzc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD6A606A31C
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 15:39:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DD6A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b4gG80mw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JpmSsnzc
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAaQR1458921
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 15:39:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lZeWqgO+2lHgeB2G3uZ2RGo9
	7UeDvnaxq8shefBQPMQ=; b=b4gG80mwz9eOkArK4wem2b/toBhwdMRvOpAazlgi
	QaGwu0u7Z+CSUeIm8cDdiaaaV6VPEWgJxDRpRzAyAmTESsDswyDXDYUdkgWFpKMN
	ol89qlux3BGZGJZaY7AvrxsST86HegLkTcj6z9xbhhevMKdSPQGIByzkP+jkBj0w
	jf1Ptq9UU6sm0/nXAuWg0egt7G9f1xDrnf64iWTmA8ikHndHH+5RZonOUPOuClp5
	k2/cbTn/BpNvlDOygac1DXQsbksoTqpXRWUSAAVJb3eilEOpaGQJdw29PQwUCt3E
	TDGLOPe3B6h9EpVUWVdOBoKUcya3aTTz1yUpU0PGDIKjXA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk82ttv98-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 15:39:23 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91b8c60c550so36678006d6.0
        for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 08:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793201963; x=1793806763; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lZeWqgO+2lHgeB2G3uZ2RGo97UeDvnaxq8shefBQPMQ=;
        b=JpmSsnzc2zAmjPe83ehiYoS3ylbOO//bHPCTRFpxHCtC/BAo6bCVS/Rk/nySFpsH2e
         Mzjr3kdUDwKrQa22oTdVWeyWNC9DYu6d4UELT+NTHWldgY2WqiWW/CevQmZXzkogEDE+
         aWym9jZAn8yoMcS4E3OLnXiMuAWC4iSNr1UaBiSyxhbv+4LK6czMHhwiZYW+eIfDKiM5
         4tauNis5fWmc4znBkBzmF8lfJC6syCA8XmiAiU2NaZRV6Kc1tg1x9QWRc/68F/ke82X5
         AS8BQNtVnzFo9xc7YcwOUGaGc73h1uVQUdukxYA6KNwO3/0VhrPC4TQjsWIgg2niyjZX
         oeWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201963; x=1793806763;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lZeWqgO+2lHgeB2G3uZ2RGo97UeDvnaxq8shefBQPMQ=;
        b=ahh/CES6FgcLoAaZO29+JhkkZX2EqUfaV+tloo9lgvT8DAiy5fnWufDMJDv8HJz5jr
         ZDaULV/mZ/muaEL7qp/+NFQNgjONWdfwsjC/a2hxPzUgxMTVjquDkhaqwb3c8APb7fHL
         8zgF5ARxfm22TB6LVy/sjDlmT3hrRwBTj9qsFl7iSKsgWJ3x0OVHuEZr3SpF4F9qZHqt
         IwFexVI7RodAuj2ALMCqoutM04qk/Y+meEqH4vtS5VCSJ6+NI6uBAhkug3LeWbJRpsXm
         RguODTFvQB75A+6w/Eyqlmujae0OjOmtRiTnJx2tSAa03B8nf4Cn9vdBDZlUBOiFDj01
         e8ug==
X-Forwarded-Encrypted: i=1; AKwUvBzJoA5MXKZVd96pGn5CIBWn6bYvi83yZE9y/hfLJtjPT2xHfXWPNPhvETgpwgc6tMdw971fwqs5Rg0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfsFvrT/Mq8/iJzo/4oMfkw3FRgdtrf6wSJA8mxEdg/67o/H/j
	QkGEFS+sIwdJ0MHBEiN1274Ze44PzmFvGGk5WQRDtYV6J3VexaP7ALhHeXQPY3X1qB4/QZK00et
	H3RzJg2ziEckvWAZre6aGjtaiW3fTLro0YM2N6m7kD/7fFCWIVj8+av1fKrmTFnpDjnxsHf0=
X-Gm-Gg: AYBFou3LAemPfXI7SucNxIfbs8tfO11xj5I03aUgCpnUTIQb22V2sXIxuhzzfcjKuxH
	PrfbFdRyTPyD0trlIbL/V0f/0j1p3KwWRC9BVXUIgozCn7K/8sFBaLsTNeymMsflVHNjENu9Kc8
	nyPaEN8ag6R2n1/5si/EkmbYS+MnyqBzXRsikSQHap3lj5Om9kRXfnlLLb0T/EK9QYZxS/XXd1h
	GhhpM0GHI0v4KMOnQRvPaAWwcXVvl4pOARTGnAzDbPCm3FBA8v4LsE7SNE4PoDMuVR00PT9kLKu
	f7wq8b6PM64glk2Rqmsra/ONowCYWJLSVolB1v7cC13gB/SFtlik41bGb9kuyJX4qXchntNpBt1
	pzDCRFxY+tK7CvPbCjdJM6hw203PpOeJynlMvb70zKFtwhauNUfYcXjGMTGORLceK7w==
X-Received: by 2002:a05:6214:5884:b0:91c:77bd:60ec with SMTP id 6a1803df08f44-91c7d1b1e01mr41624716d6.41.1793201962716;
        Wed, 28 Oct 2026 08:39:22 -0700 (PDT)
X-Received: by 2002:a05:6122:e208:b0:5c9:a60b:e5d8 with SMTP id 71dfb90a1353d-5ec4ccfee2dmr1553631e0c.18.1793201562412;
        Wed, 28 Oct 2026 08:32:42 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd4be6sm26641291f8f.37.2026.10.28.08.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:32:41 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:32:39 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 08/12] pinctrl: qcom: qcs615: Add gp_mn mux function
Message-ID: <iw26iktbkxacfgbt6btvh6nd7u7b3wvogh5c6sgdt47ve24qpi@wsc7vilt3bge>
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
 <20261026-b4-pdm_clk_gp_mnd_v2-v2-8-ff8e4bc8d567@oss.qualcomm.com>
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
In-Reply-To: <20261026-b4-pdm_clk_gp_mnd_v2-v2-8-ff8e4bc8d567@oss.qualcomm.com>
X-Proofpoint-GUID: NDdgV86izLu4bMxlcndnJagHOfpOhNTn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MiBTYWx0ZWRfXzHMOr6vEQfbC
 2nivTLUPv40vJrpTUYdb9420nJ4SA2jiglUhAJUh6sSuli0N0LhdWNgPPtXEvDg1mmHUvZ0AtGw
 BHdHUVPikNqQ8rYr+rfFsF42QSeivKU=
X-Authority-Analysis: v=2.4 cv=Tr1zFzXh c=1 sm=1 tr=0 ts=6ae2172b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Y5GSmcL30hd6fLb0oHwA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: NDdgV86izLu4bMxlcndnJagHOfpOhNTn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MiBTYWx0ZWRfX9dEYJtZE+8jr
 O8aTnkCJq33w7Kre0RZ+GayNX9SuDDgO0+apc0ZNSwnb6C/l4N+BfedILs6kw2E+DduqP53mlu2
 MP/qqv1BZhfHQSZyBHU3fFNF74aD0upVVj23lauSQVDmTMTEYUH9cOl4rzwdp7ejP8n5cCxKMUF
 wM5SDoDjss8PKJhp1nqKGYQeBPDVWHIR6zwDn/TkEnQNerSmqjM8qzh8/ToP064f2JOg8At9vNU
 AB4+Z3DyYlB7QGXSRhdML6XMUYpXAdPcXpTUPMLGDQnD0Kv9zSo0nwUFnH/1jqGQyIPQRxj/mWe
 Nsxxdv/7vnCDUGaCOrji3zY9pkGDr/gV/B3qbdoPI/K75/iBf2tiu0Wjd6zmAOIGQcgZY8yUru4
 ZGk+lFqYo4MJfR6Nz6Ap27046F5wPPrupOdvjPl83Ygfv9QIMB+ANQEQTj2YTJyqSJsstDulLae
 kM4lV0uavKo7a61j52g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280062

On 26-10-26 16:59:34, Taniya Das wrote:
> Add the gp_mn pin mux function on gpio29 of QCS615. This exposes the
> GP M/N divider clock output on the dedicated GPIO pin.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
