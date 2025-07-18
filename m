Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF001DE4E1
	for <linux-clk@vger.kernel.org>; Fri, 18 Jul 2025 23:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752879684; cv=none; b=gsTst2/3UEed4zyrFm522f6yjrFCa8eKbs74iQZZ+9i+opw3pC4vFD8Iz66a84VbsaB/aIPuvmcBX2x7BBAtkBxTOE0aMldqCzQ0Zq4W/6OJ6ocD+7aODahFfBYs+EaR+xTKSME6hEZeGuyOb6T0OqlwRJbcsp2bqNVXmJ+979I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752879684; c=relaxed/simple;
	bh=o1MhyC7RjS7VgJz0VSkaMv32v+76Isf0N7bHiSxUwrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RovZvx8c9xyt4gRC3YMeBI9W0OZIPFuLoX1c4YO7pxal/ie1KTRvxXabN0NyxnfREXoRf8uDIY70e6WdHEFM4qO2ycoAPSfyUdWViBNr3FbHoUgW1xeygZLU0nd4K53GEenYGMhcoRX6zkLafEljNfzHXHJU48wvshLMhi4Aj68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eGdaFKpp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eGdaFKpp"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IHPoNn021705
	for <linux-clk@vger.kernel.org>; Fri, 18 Jul 2025 23:01:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xounN+Z0k90J1xcOu2qxIF/k
	zUJ4PTRWo/eJEBF8yyQ=; b=eGdaFKppVPxyOPbPOHp7874GCxQPuoj9aGXk3d0V
	sBFpfLndDHmxSy1sxEG7kivH33ulxXSlVwAFKn+PZOTf3Qsrtg9vbw+HhDl7EgEc
	7svHTr751m/gr/crMpD3FA8zIMLgCuiJMkHe7KIsWhx1Hk3eLcSj6UnlMMjbmidV
	mSyCHQcBpAbTXkLPMYmNS1GnxmPAC/VFl6VQ7+kBx6tAUu23un6d0Uq3U+i5QJFE
	08GHkE5mC8pOxEhE+fnGs88rDhr7sdBqfN4VJiNjKaFIe/AhBYf26OgWOC4Z3TkB
	WNv7RNBzuAq64HbFODJiht5RrU0OLsa1nMRYb7xRWLWraQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu8my0q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 18 Jul 2025 23:01:22 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-87ecabfe1aeso455550241.3
        for <linux-clk@vger.kernel.org>; Fri, 18 Jul 2025 16:01:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752879681; x=1753484481;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xounN+Z0k90J1xcOu2qxIF/kzUJ4PTRWo/eJEBF8yyQ=;
        b=G8Hg5PxOT+DdRxeQUvkPebQz99f6gGy1p6bXTgOgjgoCLDkjFcX1cFtr1CuuO7Xhu3
         nTZFzXXL8/+7Lcw7hPki2tKs5WQK+Cokoxi8ySnLvODGIEY1X80tplN6+pUKnz/9VU8Y
         cDWbpe5cek9ZRwzbglWL8v3Oah9L2UtKCNdWcVwRyjCjyn2jLebANTT+7ZKOSFXbinz8
         bZLNHRu5tZ9FzsZb1pqohvllvlznhHhFxGyF0ldtOcVPMpUAhL9q402Kf8lWj8uGn4+v
         Sel4Uta7dkvh4hR4oQbebOJssLUqyfmWmMcT0L7FpFxHhsGDq9aZPtbYoWW/jemnmtcy
         0+QA==
X-Forwarded-Encrypted: i=1; AJvYcCXOWu1bRM99pvFIlBbBGaQePynMzWtdFR024/nH99cxsCr6vS9XupKBcsaFg00Bfxnzyr3Eo1Urg0g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNzVIe1DG1sA1xoQFBq6z8/nLF4Af4sKfaooCZOaMHQ4XkrsVM
	SOVeJMnIlWvMcaAFxXRrLT8mSM2WuVm7VLkqscB8zOY9APyo+Ip2XlkCA5tu5VYb8s/gd6h2U9N
	31SaEruLSunh6hRHj4cMiPc5OYbZ+F4mzHsnWsvbjs5kF3dQ/rw93e4ps7VFQ2IA=
X-Gm-Gg: ASbGncvXDDsuILCfwJ9jnrFcko0P41A/Q5+r/dS5YW8QiL9rTAHuxC1vLYt9JH5AxtF
	reVyIzQLrVKW5/D74C4ahetO1AVprfSFPi5gBmbXyQtd/gZ8CRVViPMn0tnnhekOxEsv7POZYy+
	txSYhaMFTBiCK57YIeAKOLGbqbAg7wtCtvCyOe8vXvqM0NDhPCd1qtqf6LHSib4PrznBEsh2bhx
	8dzmUQNgPbE8lOFT04lua/g8+4sjdD1RQVO2RpnNzTiQeZlY8OjL+K8Lzl/Nacez3rV1JMpAonc
	Kjgu/UM2YOqGosRc2CX50gxXIha1sav5hsBxCpF7smCBJYP7tfpStCabnPMXjZZ/9RikFTebH1F
	/g9lAtOlattoa5CfQqIeniFWYq73pVTQWj5tnifw5h5DF25Y0vW1l
X-Received: by 2002:a05:6102:149f:b0:4eb:e04c:f5ed with SMTP id ada2fe7eead31-4f955a7a6bdmr6898892137.2.1752879681330;
        Fri, 18 Jul 2025 16:01:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgHNVAt2FNfbpkxkswFgS8/fnxZDo97stUFORKL3rP3beeFKI+AoJdG8668ZH5nxa680wOPg==
X-Received: by 2002:a05:6102:149f:b0:4eb:e04c:f5ed with SMTP id ada2fe7eead31-4f955a7a6bdmr6898826137.2.1752879680955;
        Fri, 18 Jul 2025 16:01:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a91f0b15sm3730461fa.93.2025.07.18.16.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 16:01:20 -0700 (PDT)
Date: Sat, 19 Jul 2025 02:01:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: sc8180x: Add video clock
 controller node
Message-ID: <f2grec2qahffqgeiirr4i55uv4i344bnj7qocapsjodev7rbdq@dptsliaosgjo>
References: <20250710-sc8180x-videocc-dt-v4-0-07a9d9d5e0e6@quicinc.com>
 <20250710-sc8180x-videocc-dt-v4-2-07a9d9d5e0e6@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710-sc8180x-videocc-dt-v4-2-07a9d9d5e0e6@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDE5MCBTYWx0ZWRfX5rhHRgrib1wT
 kFzLcZHclaE3ZBfio+U9sWCS5iO+Y9uuh1sohI8xkk19x26xMs9WpyOKzz/MCgwMIUtRi/kf9uh
 TtWAzoocDZjbuL6TDt9Aru5Xq8vixgQpH3iKFrWizjnIaQ6Ln0n9wImRBWdjqqWR4G6WxodHthu
 RhmrJj3Xqcb4I/KLQuMxnfg+DDjfsD1jrmPCPgzNpFib4MRUs/a3niPUj+xzBUWSBjGtO5u5Jhf
 3WZTOBUwwKYASp0cjz7eEtL6Q1CwKbeP+Ti/jI6TREhtNAdmBuXbmVa1mmE9EzPJ3MTI9vGQQBE
 25BlUM9cGUIpIIFS1YkpZJaUU/VhehJW4eJ7ZsOb2Qo3F8QjgqjIHfK+sLjxSvr8F1QU36zwlyF
 UEWFsVN5dw6BgWPE2/2uwOfeiX41rtXUeAevU9Da2yG08GZe45aDO9Yi8Ty1CceVkHHaKgPK
X-Proofpoint-ORIG-GUID: 8LYZbw8zF17iAwaPK2Fw6nFnXox-LRf1
X-Proofpoint-GUID: 8LYZbw8zF17iAwaPK2Fw6nFnXox-LRf1
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=687ad242 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=gRvX9a0DaF5FQXGff3AA:9
 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_05,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=889 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180190

On Thu, Jul 10, 2025 at 06:30:40PM +0530, Satya Priya Kakitapalli wrote:
> Add device node for video clock controller on Qualcomm
> sc8180x platform.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8180x.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
