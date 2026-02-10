Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1442033CEB7
	for <linux-clk@vger.kernel.org>; Tue, 10 Feb 2026 09:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770714995; cv=none; b=V5Sp1FpvHao5MvlqoOFFapIrb9MUcj7cZPiloNf+0itwybJIQ02iezYxlNYuMCXTshn5TWNS3kMKAM9JeDCFbtAbsBAFJa82SDYmJI2H/nZO49Y5N+MWGWUb3F+BjKliWDI9ch/EW2f3/KBZvhcAXrpxUd9I4bHFOv+Ps//TQhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770714995; c=relaxed/simple;
	bh=oohtrnJaWmG8ArlViJEVWQt8tQOmGlQroaWIZEHlatw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A2sOzXnPfITLUepb47Jevp12tEf4lZTI2ItqDb/iGlnpf7H+pwpKfLgb9RchkuGEsWICP4cqdNnDx9Epp9v+WqbyOFpJYC9+L0IG6+o+P/XqRjCE1RPS7PhmZRriOKZTACKqqTpBMN4C2VR8VcqqwBKYQ+IjCy6/f6cVu9Liuns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BOAGhP5u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Igz1RnbB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BOAGhP5u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Igz1RnbB"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A7Z1XT2169132
	for <linux-clk@vger.kernel.org>; Tue, 10 Feb 2026 09:16:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eH+1BrdH9miSqILnClS6BrNkHjQ9waSl7nsIHkIU3R4=; b=BOAGhP5uHxMOmNHA
	KVrGB8bjQ6Ydtdipr6zMh9l3StxtdtzLgNAaWVc2+LYUN6JLrGN1L/pdI5Op7yBA
	vdKQ4wKbKuRLKMc+ebAm8tQm/9khyuddIE0pI1oWobl7xrsYBCEpJNSwETa2UWV9
	RJylOUoNLniSt7Wt/ytV/4Lx/hJsLm8NnhZK65b+ugyu9eaUB5b91GX26IEu9U9k
	oYRe3syMWxgZMV/UkHb3ciMP+h1g5O68zwHUVhJcyDTPz/mDqofcmdJTHD//wNqD
	KNvPWqlmUESodkIIl9sdLDr5amvRr9O9OiEINcX4zWGaMPBd5auZfmxcCetZ8mxw
	wlLb+A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c80drrb5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 10 Feb 2026 09:16:33 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c6de1ee12a3so1966640a12.2
        for <linux-clk@vger.kernel.org>; Tue, 10 Feb 2026 01:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770714993; x=1771319793; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eH+1BrdH9miSqILnClS6BrNkHjQ9waSl7nsIHkIU3R4=;
        b=Igz1RnbBMkqtvcNjG3e5A97CzjQ4MK2EGgvL3yovZ7A9gwH+/+jlfK4XSt1BNvsi5/
         jyDKTBYaE0CEhD9L0Z0+qzR9USavzhVJ5agnumecf7iBqupAcIw6Ptstk2wD1Yymhvuk
         T5lvAliQ/5gyWibwB8LUlBx2Ab/1RXqHOetnfTTBJXQr6PtYvV6La4YiRJkGx/0W3VRl
         N7SorExW4OvXfFv9ycX9wzJnKGDFxOcxa/73IDb0d0v2zEEm19fKtCw/FuL4rqUWAus4
         Zg0rJkT7qgEVe9s/uLjOxK8lwhQyJuRMDavWR/OHy+78EnZRMk4VqvOGM+AjmAIqfCGb
         0SqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770714993; x=1771319793;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eH+1BrdH9miSqILnClS6BrNkHjQ9waSl7nsIHkIU3R4=;
        b=b0rj3Cqjvo2vlnjD8G/wsHjj3ybKSRV35iSbVlX7MuLtxWF85kvVbjcoqqJo1BC831
         +cJojrT98AGLSAW0knQH1pva4Sb8zHaUq6wkVa4/ldngVg/FR9udeTu4KfSOzOS7m2Ue
         XpAqFkS8doVXYLZEIczz4NyLCOPPGnSAVig+AHoVPwzOmMujqmdISmJrheUX6Lct4n07
         ZCO3dglL8nQVvkicqAk5FYsFwyWYFeA+B3KVJJmBIghvhTaPd4DM6J/rjpknX0lHLyzY
         jNA7CaFiuSYBP5s2kZbTURawXrK6hriGzFzVItW6KgGPKyg1vsXGNn6vCaSEIxYkBbdN
         KFew==
X-Forwarded-Encrypted: i=1; AJvYcCVRkFmSK3Ug/r8AC/f1EqhG7d+MW9JsIwM2fJOGNgYKr1exC8RDudMwz3dbP8kEAaspwuUOpdwufT4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd9J7RpdYDSc+WXeKxznQIYINMjQSoWs94VEATr/A1XRfLnoj/
	dhPe16NnoDF9jUAmpjrV+OVhghTHfxlOyn0hv3XhZX6AumM+kKN4Z/g5YaADrOwoL0ye74wzeQT
	SbDlnPXKl27O38RLKwYshNGnhOGrKKevQj6jmC/74nFEx+bv3y+lqjew538Dd4AI=
X-Gm-Gg: AZuq6aIWhDWWfgfnjAmpbQhZpKdpw6QL2gVVNUQwcmKV5bzXVBsv2e8JXahilacNMN/
	KgAvungSL15x6qBMt0j+GH0q/pi19jLFfRMAmyCBvo/KzAG1qtKBmDqb1QGXfq6UN/d/Ctt/l/v
	ygufgXHc43eBPfYiLUuBsI+zV+9ch8XW4nrdJJysDREM8W8BIisU6F4WkaiJIl61/UJhz8Z96At
	XgYZfBfnJN5EC2g/UlTwxdMoww4na+bUX5cRS/Z6NA9MD3qJoTfkUgU5x1U5L7ybFlNTE9LpM/D
	jqEF/zJFocZv6DibvTtq1/SxaQY/QxLPDlDIUzBv+oWIEmNqNnh3tJIAnndX5S0MZs2pM06xOjj
	yZadqrolt2JF1Tj2/jM9xgvE7dyj0fFNqgI9qA3FqndqGPdoHaWmN1w==
X-Received: by 2002:a05:6a20:6a05:b0:38e:cac8:f968 with SMTP id adf61e73a8af0-393aef17822mr13893284637.17.1770714992736;
        Tue, 10 Feb 2026 01:16:32 -0800 (PST)
X-Received: by 2002:a05:6a20:6a05:b0:38e:cac8:f968 with SMTP id adf61e73a8af0-393aef17822mr13893253637.17.1770714992266;
        Tue, 10 Feb 2026 01:16:32 -0800 (PST)
Received: from [10.217.216.47] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6dcb4fc3e8sm12337205a12.5.2026.02.10.01.16.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 01:16:31 -0800 (PST)
Message-ID: <86d7268f-4e2a-4a71-8a78-c5e045556714@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 14:46:26 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: Add support for GPUCC and GXCLK for Glymur
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260127-glymur_gpucc-v1-0-547334c81ba2@oss.qualcomm.com>
 <20260127-glymur_gpucc-v1-2-547334c81ba2@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <20260127-glymur_gpucc-v1-2-547334c81ba2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA3NyBTYWx0ZWRfX1kmSBPbVCYMT
 TvSb2JRTCoI9nNxa0lOsgs5II5F6iN8J8VOeBuhJhuKjS28D2RYifd+/VIS5rl9SbZ5Y+K7l3G0
 jd/6tww8gbau93uWZZ+3Hjc6ovejG29xv/IBhMh1eu/wSzOuId09QQ2JXHPZlvO51Va4mxshikp
 ugFC6wojbjHPnxb73T/HExzCCjfMRWWhKe5pCdL00fk+NXLnx+evOlyz2lOd3m4Aw+JFwHxXrXz
 goShRGOguHHqovkjwo/5dHWi2iFkkTDO5CB9oGdBwlcoVywNPxGQ2AjS8hHkQfFurS7g/zCPk+A
 Sr4rKYg/zKXESZF/Tr6l5l1k/yolxFtUk2+ylRDdbPSoQN+foynA8O3ws14apYNXf4elVS9Lj0p
 xf1XTlMgaFqc58mRGbfLSmFT5HUs2nnxP7JS6HwENtvODOEurJ+c+uJ+GwtBN0GD/8nr/Xc2rVa
 eKbrJTnjDM8AdUw19ag==
X-Authority-Analysis: v=2.4 cv=fd+gCkQF c=1 sm=1 tr=0 ts=698af771 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=-momvpiiut8LGs_r7JQA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: hRj2CJQotp8P_cN2mxhWUEVknMiaulSE
X-Proofpoint-GUID: hRj2CJQotp8P_cN2mxhWUEVknMiaulSE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100077



On 1/27/2026 12:45 PM, Taniya Das wrote:
> Support the graphics clock controller for Glymur for Graphics SW
> driver to use the clocks. GXCLKCTL (Graphics GX Clock Controller) is a
> block dedicated to managing clocks for the GPU subsystem on GX power
> domain. The GX clock controller driver manages only the GX GDSC and the
> rest of the resources of the controller are managed by the firmware.
> 
> Update the compatible for Graphics GX Clock Controller for Glymur as the
> GX clock controller is a reuse of the Kaanapali driver.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig              |   9 +
>  drivers/clk/qcom/Makefile             |   1 +
>  drivers/clk/qcom/gpucc-glymur.c       | 619 ++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/gxclkctl-kaanapali.c |   1 +
>  4 files changed, 630 insertions(+)
> 

Reviewed-By: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Thanks,
Jagadeesh
