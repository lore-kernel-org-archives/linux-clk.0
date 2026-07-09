Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DAF3F86EF
	for <linux-clk@vger.kernel.org>; Thu,  9 Jul 2026 10:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783592927; cv=none; b=WYy8/hBDNdtjDRHiF2lxEKbOcKbyU3HDkNIyraPSykhTl9gCPHkXknvGLAYOPximiYb02wIy1r4yFORjSfQRJ9GrNFz/+J9DtizRMvgNgOQANgCqvty1abJJJ4aHURlkWmZJmc8d3ZnPF3lEajwEgUqi/013oyXV0BJPYC6Oj0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783592927; c=relaxed/simple;
	bh=mtrAGO7mzZ2k7NrAqzt8XhUVSlLeHFbE9hM1FDtniM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BtYMhdp4IWu8QTykX9pFlncg56CUY0dAPx9uXouLkpISD7gpp1VXTmrGmYae3FXQNNIgflo2utvRhC05ESrGKwCucH6hxv589XzUIgRKgulvcIdmdQA0Eimw0/1UnfumtrrhVdgIiDF7pINhbbZhhTF/hT3yU2zmgXpTuU+AQlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VlMtUsUy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ipicMgQo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VlMtUsUy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ipicMgQo"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669ANL5V1522104
	for <linux-clk@vger.kernel.org>; Thu, 9 Jul 2026 10:28:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=N+Mu4FsQBWM5HoD7rwag4nRk
	lNeKKvXIE29VJ8JvlH8=; b=VlMtUsUy99usAcVIQQl+wLN47VrYTf/g7pxK0RxZ
	ak+N/6ud9eEgb5TONdb0MYyN7MtwBLy9Ta0x5pC/6jA6JYJ+xnIepiL7KosESB/X
	LsqGVWzIXKuXNmBQD2cjXnubc83vKw00wOuIv94n4oRxSpCvmgRPhVQBos01WAqJ
	sGd1k9520cfcXQM/j2HErMELKglzqa28dWNVuwPcDDXTcd6jIWRw/cR3PFfnGkdJ
	MhABZ1KUw6KBibVQzUI/BOokWwPwX7asLVZ34z9aMqrU+5qAmxEId4rDgUo933WV
	RAuB4XY2ZurpzClGuzq4qIOGv5z1DWWx0tEWc8LBuDEoyQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa6p3s0h8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 09 Jul 2026 10:28:45 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-737f1f1e0e5so468362137.3
        for <linux-clk@vger.kernel.org>; Thu, 09 Jul 2026 03:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783592924; x=1784197724; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N+Mu4FsQBWM5HoD7rwag4nRklNeKKvXIE29VJ8JvlH8=;
        b=ipicMgQo7nhBw5xzRAgMhL6/rAl/B3CBWCIxtgxCB8jvnmtkbuiy/08Skh7L3F3ZPE
         i0gjfyXu8HhSGFNqAZVFmqNyRG6pRmU1vHQHm2O/4XWcxL53vuJHVN6GbsukkSKjy9B3
         MdY5AM1/KXCQ+lraajOc0Uxt7ATyyXOjfQs5rlzdv8tr3Wzr9OYd7iysxtpixIMtEgzf
         17ZIU0z5G+zQD8DhqDAdIVmHwQaoU+xyNZI59TpP6aHyMoFYZ/hczTNIA3dvhDDa60x0
         pIxkaI/hy5E1hVvqw5PtkiqNfn75jkIHNCgxb0TqAbZbbIE1b0tp8BT1393OLOLP7vrv
         lyoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783592924; x=1784197724;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N+Mu4FsQBWM5HoD7rwag4nRklNeKKvXIE29VJ8JvlH8=;
        b=jcD4lJ57yue2m3hUm1zPws+UWS41FqLxmrV3MsAe1xHPAesAvPGoM2zg4rWOlBr2Cj
         7ax/3yP2IZ9hYPHaShKkTlGXNiKNNbenIO0qR+9DNv9eTobf3+Y5833yPYC7jLVJYAb/
         d8AW+f4sBmPbE2MgBXrcUwkhpbs+LkUspz8fAngtYMZexm2rW699IG0N2eq3+n2PMfpS
         uzx7MDOjeag6XX3dbx5T5Ockx8hZVmG01IlOaedn+lwq8GDO0o5D0c8tQ3cGB4qdoLBw
         nU2Jb54tXetTfFutycMJd17ZW5dbXqNMLySJWEW3vaPclvvX8FHYcZWba/svImRKOQOs
         G7iA==
X-Forwarded-Encrypted: i=1; AHgh+RoS3Ry9sIcgjzoFUTGYbOYuN/6pRHRLlbp4X1PcvFKqwZ0yRlQ+VYBFgXPBHXFdzBej1OS8Cjh7bDY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxK5eXcx1GI4LMkimfmyx9RLmKErhzf4QEi1JSaWolyj2q9Mm99
	IFPhMyooVLKdXl61IQ6aETk4IXv+wclZKuH8TkDsRlfBtSDLsXsbKubLOWTPgWqxAdtLwx3pjbm
	sly2TJEHzJWJsYVY0AdlbBQpw+f4zrYjCAS8aj8/qmgFsTfwMMLatEyDc5I3tkLE=
X-Gm-Gg: AfdE7cmUnQwnUXKS1SEDedraEnCmwWv6t9A6gO7YIRgy4D1po0cExkum+wAK5l1MpuD
	jftHKiNzEGCl7ZT/WxsFHEKXUMgL6DuCHaDf6eGCIttlQ5LDBdR1859peggsMhh0uah9l8QmUPC
	UlwKWPqbKb4ry/OO4z94J0hMsYGsi/Q7yc+XQi1E2X9XobDRU4Kv7ygnmkAOhIhHVWzjkO/WUIj
	PBbeeIPG5luLwUhfxMldeu5Roq+zCTANe24ls/xI9ArXRE3u4zyxZgq1NH3DayHyhVUMDxnDvbk
	YKT+bN3A3DSlHX9/4nzCBWQo9YLIkEaIclO+chvS2RmzgJOXd76ZsyKMt2XXC2RPg3obd1ycqVX
	SiS/4bPtgn9DWpESySHvphylY0yIp3kaUTTMhgiTprGCfx0ScLDM0OhpCNATsJZbSdXWQ64+zGy
	yhsVHhpANzI0pHaWaoEZFzJ8qW
X-Received: by 2002:a05:6102:1607:b0:631:28c1:154c with SMTP id ada2fe7eead31-744dff3ab04mr4551323137.9.1783592923588;
        Thu, 09 Jul 2026 03:28:43 -0700 (PDT)
X-Received: by 2002:a05:6102:1607:b0:631:28c1:154c with SMTP id ada2fe7eead31-744dff3ab04mr4551307137.9.1783592923132;
        Thu, 09 Jul 2026 03:28:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b00c76dcf8sm1613638e87.39.2026.07.09.03.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 03:28:41 -0700 (PDT)
Date: Thu, 9 Jul 2026 13:28:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/4] clk: qcom: Add Audio Core clock controller
 support on Qualcomm Shikra SoC
Message-ID: <6m6oifeecvv77xsbbstkkgz7k5qse4azj3rbbvi47n2wbasgt4@7z4zgsiatg62>
References: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
 <20260708-shikra-audiocorecc-v2-3-b320d822cdd0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-shikra-audiocorecc-v2-3-b320d822cdd0@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: e_JNYD9Yddg2w0If7ruMeBrrPa-KvfrY
X-Proofpoint-GUID: e_JNYD9Yddg2w0If7ruMeBrrPa-KvfrY
X-Authority-Analysis: v=2.4 cv=TPh1jVla c=1 sm=1 tr=0 ts=6a4f77dd cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=TegkrtGQps0JBSonG1sA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEwMSBTYWx0ZWRfXxllVmmVL+qIq
 wTWDXNdbwVK3Y4tv64OEY9q+kFTwzs04PjYpcGbXGQK1PA1Vb166kSU0WTayTbBAQP9EkulD6ve
 GJuGttwW3341AF768KnPxXZ3If+FzTo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEwMSBTYWx0ZWRfX1qo+oH45rL3y
 Z4Ls9DKBvg7QnzJdoKYqk017MmYvMI51r4eJ3Krw1QTx7DauikJbWUZ6PGgObOUCZNx9JQuNrle
 WuMgtpgQE44ZI0svNwS0hIxW+NqUYAPJzHhy5ZH6w9kSjDHXIOmqcMvtb7Gmy9P5vbi7dpWcWyJ
 kPo/kpq8LNmH7ECgvQR9o4SndVa+CT5/I1LyyQDj6TacRNIWCFCACM0ODqKRrE2V8mjek01KbK2
 3swxby29M7Js6iP0CrJmvTJEUu3Neyn7O/EbFjzvlIN0QnHqC+Lh2yStQKXyIAgW81EoH0SXK2S
 GeWC/tqjxuxYZClmlleqLRE92d/PRaYrHAAZ52jdi2ZKu5y4v+mxznL0/HNmqYK4ik/54ZAhqkt
 dr948I1nh3Sn319MRlwkIpL+cLvf6kyAPrmleAGKxrxW82iLkziLnF7qmwJmLbOXMPYFebHOy1A
 OnnnQoRKnpCCNngdkxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090101

On Wed, Jul 08, 2026 at 11:55:07PM +0530, Imran Shaik wrote:
> Add support for Audio Core Clock Controller (AUDIOCORECC) and Audio Core
> CSR resets on Qualcomm Shikra SoC.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig              |  10 +
>  drivers/clk/qcom/Makefile             |   1 +
>  drivers/clk/qcom/audiocorecc-shikra.c | 809 ++++++++++++++++++++++++++++++++++
>  3 files changed, 820 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
