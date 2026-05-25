Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A7737D113
	for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 11:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779707253; cv=none; b=alLKtMBVUoROT0Bn/V9krPfQydD4nR2OTV80OFMM835EaoOB5KylTr0qoaYiHtWESWHI9hCnDCQM+c69JneBFHIXq53rJRq8cOgMm/X74WczxrVV14lZfQrI01Cz6oZ4Azd7C+xTF4IQqf0j41z3thzMHMJ8TDHYwA7W3KXehKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779707253; c=relaxed/simple;
	bh=Qj1Llq7OC4zvhr5rArx3ZwsQHeqZMEqHrESIwOmoW9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fAoGZR0mx8+grlvAaFNxpDZK5kHF6HP+oy+2ekqB6BS88yaUyEFNogVAWdmn79SOy/sgL5s7X62C9wj4Pvzk/sPcpX1WY3nPZwthDPbk0TlUdjEiwWpT+n0n1CeNPMK2zjRtfFxLyUdL5ikAQFUcOnMyVaXpNf85iR0Bq5TdL/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kGi2RGmB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i2GsTHYK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kGi2RGmB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i2GsTHYK"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P9leF21457776
	for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 11:07:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/5NQfF+ZUa2lq7+ZRulYI6A2
	NsYPt5ClBqhGGJ3BoYU=; b=kGi2RGmBw1JUMOoGdEou6hvnPDbPITcGo5Mt/uJu
	CRBahgR1LKFIrw/sgAokxejEB+4OK7Wsu4gDmyxuLP3N++LW/9Wm2s0DAAX+xQGH
	qGXzjDboMFXCPairiM9W8UsJbigEQORV2O1mAD/s4lKSe8UXgXvmbxa07kE0xOXV
	Q68r6KwQkuZo17+sV8NdI+9ZQn7QcO226pjtD5ENpz6qKCahEgUQLTYzVienfz0H
	8nfGnQ8pAcoTEWijFzl9EYYXwwkPURTZ9R8nBnnWithSIdpZrHt0Am3BVeS12VSo
	w7ZZKSCNEF/cb0ZVSmLJrH5vyCOnq3KO8MclI+P/e7zHtw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4f3eayk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 11:07:31 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-956732444ffso16678567241.1
        for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 04:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779707250; x=1780312050; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/5NQfF+ZUa2lq7+ZRulYI6A2NsYPt5ClBqhGGJ3BoYU=;
        b=i2GsTHYKkpRGRh0EhGCqa5ttHIUzhVqZqOVQyg3O2CizbXTThjXo0YQMt0k1nvFc1g
         UU8gdPPNwhEqXRwM2Eo2A7SGWjr0Kxn75L1eVayWtWZVq75KtKKUFehJmNvi8sbG14Bo
         48UE/eoKvcZZ7yJGV29VFqnywKp8/YC2ZsSUn5FfV0Dg20vMPHeGRfgN1s9wq7NVMaSh
         K3cKf76wjcROSatgEAQYmDylFfgdl5DymurI1vbFv66LIYMrDm7EB2tWETV8N+44WLs6
         8AmTQ5WuwdJD88hFTQhgrTH/RAZzoWKEQ+eNOD+Rxor6K5yMYlzA4SC+808bmdymILRV
         8h8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779707250; x=1780312050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/5NQfF+ZUa2lq7+ZRulYI6A2NsYPt5ClBqhGGJ3BoYU=;
        b=gD3RrBE6zR28PFV859u68srd36xgysvMlAYBrsKe2Ngz6NBe2r8Tci+tSYP+UuRZYm
         9APeiLdeZIrrdytvP4Blc4+nq/xG0auwmVWaQ4eT4kDGwsqCCzjxy0NC4PPjv4NbE+1P
         yEPx+jue77VojS0x12OFvxcFQiyddxjl9lt7WpWjOuFhWbWsa9Xr1Nc1IyZq8rHx/omM
         6obILA4US8uocO3cGszTKzKU4I8YdhBWQwQgwVLrJDgXtvs9Gb9oQdkBf62Psg3/pG4G
         e+G2+PmWvh8ejdoPosvRh9kfN00THV3vr24dtKrKl82pC3dOIHZ61ibkGi9zBafENaWx
         eesA==
X-Forwarded-Encrypted: i=1; AFNElJ/yro0Mgmq8mTWRBjc0NKAVS8J8FYtj90C6p//VVlVXa1AUmKt/oZ3MrmBi1Qh/Z3i2xI6oW6sHzrg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrDVpAvseNXyr7LMjuKegoGeGbAdM4qfpgKV1LMFP5EK5JvBnY
	9xaPj47qvKlqDYIp9tnByulZScr7VxQADYNZxSjsS+gdCjalHrwiLqUSf/Svt6DLnZykKwsmX2O
	wmxf9xt0XDEk0m9fM+fjaic/1W2HC+zNIN2O7CXBTuusPYouv0Camai0cKuZ/8AI=
X-Gm-Gg: Acq92OFRlsyc2o2xZzSDMbxmLki0KuMAfGGRQvWF0bmQQci5uT81QujQU48oVrgMAnQ
	0G2FNsmdfGtRA4LTE5HA21pVii4dpGZin7g74YYWXnugioCt67QbgiU57ykEVW/wb4bqEZ1dzTS
	t0EuCACfn4g4habk72+V1ei2jH4DfSRHGh1gN+WypWJ6s9yQBz1LLU43ztGjubVv8ZFl+y0t3qE
	/1+huawWCEl1ZF6v64Rgy4jFNOUKDZFq6LMOUYE5uesyaGtaxBohvIbT67nfyinWDb1ccAczf3b
	dfVg4rho+HSrrLtVGwvIYBUpm2VqB1bP1j6lXVWJrrm+2AM5A55a8GVxCpaENr6jsepIRiZwZyy
	yR6WeFw1YJSYeKoObjvuh759Sr+nJx11cHgofzn/cRD5Hb7eGIHBTSftqL2C1omBNur05qvCKDH
	Tmtj+dPxHJDQEsNo4rPQaM0FRKdK1/XLWu0Qs=
X-Received: by 2002:a05:6102:688f:b0:631:81d6:e158 with SMTP id ada2fe7eead31-67c8fcbdbdfmr6780138137.27.1779707250302;
        Mon, 25 May 2026 04:07:30 -0700 (PDT)
X-Received: by 2002:a05:6102:688f:b0:631:81d6:e158 with SMTP id ada2fe7eead31-67c8fcbdbdfmr6780116137.27.1779707249899;
        Mon, 25 May 2026 04:07:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cf96b3sm2600950e87.80.2026.05.25.04.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 04:07:28 -0700 (PDT)
Date: Mon, 25 May 2026 14:07:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 4/7] clk: qcom: videocc: Add video clock controller
 driver for Eliza
Message-ID: <bnwy2srhmflo7drgavqonka7wrzbiwas5xjbabei2b6wfzci2b@62pkd4dr23j5>
References: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
 <20260525-eliza_mm_cc_v2-v5-4-a1d125619a5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525-eliza_mm_cc_v2-v5-4-a1d125619a5a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: pcr0SpTwEff_Mrra9OdYJQ7MPNWBQvy4
X-Authority-Analysis: v=2.4 cv=WvYb99fv c=1 sm=1 tr=0 ts=6a142d73 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=d7ClhsmVZ3m4v3ji_18A:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDExNCBTYWx0ZWRfX0csZRqtiCsp4
 HMrlV0Mnnk2FSTt5kSS9G7CfYxg+TnyCfiRpeEhhPj2OzAciVtAyOQQBQXsJs2LlcTbAsRi7774
 nlGCTtJWnn7fqBKMp0kGtwpT5daL4iXjlVu9ycOvJxKzxMndLCl0ZzcEmFKVe71CS68rB096f2u
 MNZ9K2Lsl7e6zVFcy8a/S/y1EIv58MVEgKMeEzhZA0bCnnhtP969QApOEqF3y6M/YEOO2Yueie3
 hgOZNyJ7moQIU6H0z5/blIgX5gjE45hAr135vpFHWTc6gtcD3TSeSEV6vxwA3xtntDkydb33TV+
 xl4t5E1Q4B9fKSzU7uaMNwKHvr4/ngJA7d3UWyyikigfvg3A/ue20AXOulRQ9ypla2NSjuRfIT7
 cS/qpgcbGTW2gCqWt4qL6n/OtOzhF+duLViCHA//4EBb0DwZJGjJnwqIqymJon6nD1Lzo9SijsI
 PmPzHEerLt6csIp1PQQ==
X-Proofpoint-GUID: pcr0SpTwEff_Mrra9OdYJQ7MPNWBQvy4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250114

On Mon, May 25, 2026 at 04:16:06PM +0530, Taniya Das wrote:
> Add support for the video clock controller for video clients to be able
> to request for videocc clocks on Eliza platform.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig         |  10 +
>  drivers/clk/qcom/Makefile        |   1 +
>  drivers/clk/qcom/videocc-eliza.c | 404 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 415 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
