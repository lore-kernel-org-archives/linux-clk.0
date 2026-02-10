Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BF67478
	for <linux-clk@vger.kernel.org>; Tue, 10 Feb 2026 09:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770717224; cv=none; b=YhKy5h2Ln1XQ9N8sQZ+pkg6OCh6LmnfHg5yDmt4TBLc0nHXuR0+Ldz9Dq7LpHQwm/KRoWSO3hoL2T3TTWpe4d9bhiJLQUzMHk3B/zBdEv1BAtYtMGdYsY4qV57Z0oyPqEWfXoP2ZrzNeVdw6kwRYSuH6j/9rfgztckUGW66Je94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770717224; c=relaxed/simple;
	bh=KumJxGa6qTFlTl9rpdtKJde+I9qSpWW/+hpWP6CkDwA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=id1i1jqyJFc7WxIpjXsxxjwCJTFOYB5VdHzHWZRUeZcZGhe7TjC1D6hzb9Cr5Tt8cnRblY59ut4F7pmo3AeoZWozB4BiNshJh+mrKCX155Y82XSowmbNcoseWY60G1TDfvQTVnSIqJ1WXk9BTWsiQaGZwW2UI2lKZf5Mp3MS/ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G6gZkou8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KtLEXdpU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G6gZkou8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KtLEXdpU"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A3MKl61172379
	for <linux-clk@vger.kernel.org>; Tue, 10 Feb 2026 09:53:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fE0JtBuPqrjoJF+XmMNOZcHSaCL54PVRJabZmp1KT7s=; b=G6gZkou8a4h7/6k4
	8R9EOb2vaLQFYJvx3gsL9/VCXIkd34KDnMvzgosXo/sQhvk+9UBG7fKNSvbPQqh4
	SpVNHYSLu935IrrzRIGthStwPWS8bSDkDXw4DbYNYdsKlZe+xNwrfT1ggCVrGaMn
	gM1KJGWRXr/myLyBKmYZwArbjhxtW29EhPoauX+9ZomQeJJcJcGuhaEH+3z+JpKH
	RKuiCsYFZwneRXox81X9i8Ceg2UomLDTgk2jUCQELeXNRRrq2VRAV9JySUBOIMMx
	1b3pQY7jC7t3dLhZaKNrp42j4hCkCz+mT18F/pg4qA8BtuOrrAUD1T0oRGYkyKCK
	oTTaug==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7kftu2n6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 10 Feb 2026 09:53:42 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8954937be97so13861956d6.1
        for <linux-clk@vger.kernel.org>; Tue, 10 Feb 2026 01:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770717222; x=1771322022; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fE0JtBuPqrjoJF+XmMNOZcHSaCL54PVRJabZmp1KT7s=;
        b=KtLEXdpU8ZJF9lbY6wJKDyPkVMvKqaawhLWLiyQ9QUi0IhFKUOBKBAfLsfh/wMujkR
         e7jVaynRcBcdHE5QQDhJnShQF6nFCYPO7zX0JwJ5L1ClRfGk1canPov6a0n0npg8mLmr
         596wNoSpqzCj8QAbv+HwXvH65qvkj38vmPTFPs0NeUDDo3z2+2uGNoS3hcS1G4QDo6q0
         aZ7tT4vxTjEKtJMQ2zz1QtLuDj5GcHQrxFS9h8s8ENt6Abu4yyALcKYnLsYc7kjrGGmd
         dm/DQ5+23VqRPQvcUGS2ZWOYWM/JB4t5QtxXm3gWw/L0b8WXlYPs12PYlbs0faJPkMpt
         xroQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770717222; x=1771322022;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fE0JtBuPqrjoJF+XmMNOZcHSaCL54PVRJabZmp1KT7s=;
        b=ljdUGg6xXd4fNuPiFH94o4+ZX1cv1bRlNmbEvELphbCb1BpKt6daznN2KnATuzFHJ6
         iy0G+Iz+KVqcOYxYM+8OTQQkTZETOQdvTH/+te4hMSsy+KtYepp4DLAuVrr1Nkn/9cgi
         P69WUDIXi9OvEa2xwgWxpqZGcMS+rHDtUE9vutRwU5AVvQgSNl5GDK3s3hwu4fmr5ecM
         kE0QUoQv2riN7nqixfavOMOQ6dxDvAqbF1a8ZGHphwfyfiQnBGzLga3fwYObnzK5AFo+
         VYIrR80hsCPlkKv2GxNSE+VjOcFMlkNvXRpvhhf3WAHGi57SIfFwDZGFssakFpcxlqzz
         gmHw==
X-Forwarded-Encrypted: i=1; AJvYcCVVSi9PSUdQvZJtvnLAXjHXAgu63NyC3pP00jxM9xulzXacPfvaFRhLmZaD8TvHL87qhQ5ZUyuPWok=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz05yICBmsrtlO4WPEpFsy1E3AlEciyWn1iJhuwaohEThD34LtT
	EJzynL7l8uWrnVi9ZNuyefcAxvHhqvwwGq0eaazL5EtIbEFPXahiBtfA9flyKcNKIFHEbyWgcLv
	McSG/oIfITvN84NV1rqoYV2x73uSfzGeZVeSA76F8QLPabVw6EtXlcy5eqPct+5s=
X-Gm-Gg: AZuq6aKUsIgO5Xu+kwhYyUbBe1afBCtsyRoab/VRywiUbk+dMsZPxtbbMCABwUX74tj
	To8AxGLpQFs+h/IcqPkdjllfJk/JTIwY06y7MGw74vBvmINx6/7U1+uusjw6qn26CoS+ZLHMJa9
	wMXOSC4smDphAznOTad23On4qJlf3TNqrQHa1VgYl+GhVXE3/Z6no6wqVs8Z0yl5e+1E/wTFstG
	99vg0hTFbpGvZ5SIsnas6DTyDdp7ko16e9m2uI82ZZpYJqIaVRn3bT+wSk4GcC1voe2wYxr1aCW
	zRJDJDzK3yih8qfDYbljGTxbY3r7Tc5uq6u0D58sRvg/elsQeONUl3aLQmNdZWCBHFSLntnHRHo
	f0eVAjKTF+XN7NU7y1pDtcUEV/rhwP2MaPKrfee1bwmEeTNHH27slwPpMdGzOIzhGAf9INYpOgU
	2z9H4=
X-Received: by 2002:a0c:e011:0:b0:894:9309:a2b with SMTP id 6a1803df08f44-8970fce3f4amr8470426d6.1.1770717222186;
        Tue, 10 Feb 2026 01:53:42 -0800 (PST)
X-Received: by 2002:a0c:e011:0:b0:894:9309:a2b with SMTP id 6a1803df08f44-8970fce3f4amr8470236d6.1.1770717221750;
        Tue, 10 Feb 2026 01:53:41 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65983e5f42esm3741334a12.0.2026.02.10.01.53.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 01:53:40 -0800 (PST)
Message-ID: <3127c126-5387-4436-b4e6-694c1354ce23@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 10:53:38 +0100
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
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260127-glymur_gpucc-v1-0-547334c81ba2@oss.qualcomm.com>
 <20260127-glymur_gpucc-v1-2-547334c81ba2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260127-glymur_gpucc-v1-2-547334c81ba2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA4MiBTYWx0ZWRfX86nFgR+M4x5h
 ZZKqFfioPNUlySmrPe3bdtmWBCligGGxqK1QRM5nwglAwoO25nlVbSCKXsFu45+3XaRrbriZqPA
 /Hu3IkKpRYmEtzhWkzeHz6pniSGGLLpmI/1ACS7Js3pdXRUFfpGyAIRD+k0ox4oFr94tAaa/Mw6
 35TXAdz9kponW3cbkgaG/99jOtnfPMC4qfdmiQ765idKK8HKxzHXzIp4U+u5UDqJOv/V1qhKzAS
 iNpq1WCQ2RvprmsLarQTYyJGvkaVckajquNgSxnBYJjTScAi8Ricreth/E3tKxb+HierpK7oJSU
 3dVRtqpN5gCZ1x6RzBvH2lfS2kkyTblC5LLaO2DdPMS41G9YXAbycb3VJk+tzOkfwNoM4ELUYss
 ZDlRnXP36k0utaUr1HFbUbWZQ1kKgcel/gN//J4IfjYS5wYA4BYBkPXTZMbBFLUCDxeRVQMqPQX
 2OGsmdj/av/VA5amkBg==
X-Proofpoint-ORIG-GUID: z-WPWJ_we8NM01jP0Izhv_os2LX98bJ9
X-Authority-Analysis: v=2.4 cv=XfuEDY55 c=1 sm=1 tr=0 ts=698b0026 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=-momvpiiut8LGs_r7JQA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: z-WPWJ_we8NM01jP0Izhv_os2LX98bJ9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602100082

On 1/27/26 8:15 AM, Taniya Das wrote:
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

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
