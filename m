Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C860D37E308
	for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 11:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773143248; cv=none; b=TqZaUIWSbgDANe/XjQpKWQKuSayTt3HWZJMTeOCBSWhpgu3viwAQEc6e5JJUafWwR4+gL85lY12vuFi5phRswuw+kerhke2g1/GNbyeMzYxdile/BlgYmcoyGm2+e5UM7hSMoXAWZqiJvAkeRb3giz2uLtZb93cgT+bn0zYA6I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773143248; c=relaxed/simple;
	bh=3TzIzozpkkcPshRim4uY3bWDxbMPNuyIhaHT6FqqG8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NokfwsOh+Jhg+SIX90OsWzrnPXAxMibjOv9R0rbCCC9MKaC7or6wx8ziLKJ6CHKFplyu5cmQNJMf0q0rmVB/6nKsonzejnAV296EXjEdTnFk7IBA8auShTj3LOjJ4JgM9hx96OMBhphD7bUyAPH3kzD3BEgJfq+aMTqw6kDn1jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CUseJ1yB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i9MqFv1x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CUseJ1yB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i9MqFv1x"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A90RAL3587447
	for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 11:47:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fLjziEkCWvVYAwCSbEhEhM5xOOiTSe9RlV+ZJVYKifA=; b=CUseJ1yByI5+Aoey
	LjcA5dfs2eht1ShkEXB+Uac+WWZaO/p03r538dllkERYLmwmnB8iQ+x/bNhiUAL3
	FLgKg/y7/IeFRoiSRC22X1SMWIvKTVy18v7PSIsY1GXFum69Nl4cFqEaO1Mp/tHh
	T0+jCpfhxV1ZUtbptrqmuCLbEttXAFz8XW/b+sIjrd7kk4/wPSVkW+GaIIZZ9ybl
	QYhf946WZlv1q/3U2ejfGh5ocVmeM8F8Rly49lXM7C6oWMkP6h1pDMx1fUjhslpX
	KwMpoZEwUHhgN2jDwXr2C+rjkJfvZL+/bMJUj3ehDQc8gZxczj/FYqj3WTNjcRYg
	KsZBRw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct1ekuq20-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 11:47:27 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89a012f8ab7so55838476d6.2
        for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 04:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773143246; x=1773748046; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fLjziEkCWvVYAwCSbEhEhM5xOOiTSe9RlV+ZJVYKifA=;
        b=i9MqFv1xBipG1sLv5ljvXxNCwGPdEf2ZteFVnk3aBO2Qhc2qcMBgo4sNG8IV39cAES
         AZFuDzrfSn7v31qbXhCJqTioFnupNZBlE2ry8qBArEB0nXvHsdY7d7KF83YbrnKoEjtC
         46BCIr7L0Hr7qhrlsZcIq/Im2USnWNC8dZx/0kZGsaVz6TH1ZlnZox0WGLZGV8A3vnYz
         jR2H0Hxy2/GyAzOZJb0xe5rhEvNeQHMa+DCXVVXf9DdGiHNAxbovSyUyUp378A9dEkup
         oWqzbHItny7QWVzY+cpv9ZPpjWGTZ5XAiWq4aryygAHywFhVl7xEbGB0XZ6MnOa2FkvH
         GsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773143246; x=1773748046;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fLjziEkCWvVYAwCSbEhEhM5xOOiTSe9RlV+ZJVYKifA=;
        b=fs3Y8mhn4CmAZRiB8IOD/tCNVPSZ4hU0MmFUIREXOch6W+2Lr5d+pZ4K7NBf6eJPcr
         z7l9oFDCHyjiW5USSBB58zkUZDw82Dgr2bYYTENy0uiNGMWOysxj6JePsBM8+7YXiAg8
         9f999ybpihPzcwtBlqB8gxn6c35lZz9fif2WNUFN1NVzhV2R4b7j0700zvIPL4EGCRr6
         AEHnOOdVjtmBHPmb9V3v4JxjzwemhIA+MwafP5kofXLDv92CffVZhqv01EKBIjDxyQo9
         UMNfg4gKVOqO5VybD20wjaMEj//3CAru2oqCB+n8k3whR++5xBs+0SHC7XZegePbHK++
         QeFw==
X-Forwarded-Encrypted: i=1; AJvYcCX4wk/dW18f83NWG+/Lx08SmSh2l36hxABSE+K8Wl7V+cnWHouEaaVLvb4TkPp78H30ArFD0BwUPYU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzE4HY47zIkBw8BnqbwM5vde5FsBUbcYJ35Avd/FeKde+0OsOr0
	YIv5AHVVssmUc34H7BS+qdXRG00Pc4Kj86yRiEhHIQIhKQdOMrX+oVrtJFk7klYxukK4WJL73nP
	gMtm+7TTV5vNAgyxLbT3IfDIv7bAD6liCU/W98BnfXy0WjXtub2DtumMPdOWjghIDV7b0uPg=
X-Gm-Gg: ATEYQzwledeJLEnmG9f51CBEuB+/wVAhNpCvSoPWwyRJg8x7OBYZGAkQboNtsMIexd1
	EtSryZDyhAPEcolhMg0tEcXC/03d1hPWg5bUAKLgrNUnc13oU+b0qD2QGeUl1p5/HQ6nb+BMer5
	frmpq7Wbpv7R//GKETub/1Sm/WFUg00Z2wIRkDUTi5A76A1tETZ0yGVQONe9wXG3qhvBhMlO3cq
	jJejzgt8jS4lHdvZA5uNjhh+Peb3NlFQoUD49+GMGL072c5OIyrmGc+oA/jAuQpNbC88gXHYxhf
	5pJWarb1mF/MqIoCQDyqO6HGT+CaqODS2ByHLGeeVRLoXCY24pRx31jHZfCtDdpJUh3Evbk3isG
	7trvEkYREjoyE0hjY19kIOKkZgV0z7LQ4kaLBy3QuOE1lN/6XKcRJ8C7HM6l1d3O17NqvK8f2gy
	o7SPY=
X-Received: by 2002:a05:6214:8017:b0:89a:6263:feb6 with SMTP id 6a1803df08f44-89a626406c4mr2042176d6.4.1773143246035;
        Tue, 10 Mar 2026 04:47:26 -0700 (PDT)
X-Received: by 2002:a05:6214:8017:b0:89a:6263:feb6 with SMTP id 6a1803df08f44-89a626406c4mr2041896d6.4.1773143245673;
        Tue, 10 Mar 2026 04:47:25 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b96da58b66dsm369600066b.42.2026.03.10.04.47.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 04:47:24 -0700 (PDT)
Message-ID: <e15f11d0-9b8d-499d-8d57-a465c65a9c64@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 12:47:22 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] clk: qcom: gcc-sc8180x: Use retention for USB power
 domains
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260309010214.224621-1-val@packett.cool>
 <20260309010214.224621-4-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260309010214.224621-4-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iy51C4XD2CqQ5oqBZLrKwDKYyufh5CS3
X-Proofpoint-ORIG-GUID: iy51C4XD2CqQ5oqBZLrKwDKYyufh5CS3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEwMiBTYWx0ZWRfX0a1vYP2BiTpu
 1n8072BTB1LLYT/jaTV6BtaHRlwrjx1SQWb3TowblQKROMLE1/W2LVeRUfCs3aRE0zgP+pv2P1A
 +rQ8tMkqMHzU+VFq6MVdjYVmhBzsaFb9O1o6FNnYbRApeiPZZ9hRqaFSxxW9YsRuP9r/opu/590
 KdI1p+h2OSbbpPi4Dct04RiIUa+0gK1hnr3cIa0rVzg0ecQwc/RcR3bbUKKdr4oDIgWvlQGqosV
 8hsZnASQAqu+2dvX0n8cHnDxfuR6FDa365NASaV/AKWYSupxIYb1B4GU8Xc8DoJq/mJ3NdZVv/h
 f8BOG3I7Zyr5WkIy3awevf39sEvgw2/Y3AyylVAH63oAeHwGhnpMYHtwxbgTMQx881c5ou4PXHG
 R+XMYHrRFThnO/LEA5II1Ebj8LOHTHhroXkvK+4TYU8CvPU8F0X4vjrWB5RMTdST4dNXurf/pUN
 A+kWVeIKFliXrF9RLBw==
X-Authority-Analysis: v=2.4 cv=eIEeTXp1 c=1 sm=1 tr=0 ts=69b004cf cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=M0n0xMwgRafrvhQXqkIA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100102

On 3/9/26 2:00 AM, Val Packett wrote:
> The USB subsystem does not expect to lose its state on suspend:
> 
>     xhci-hcd xhci-hcd.0.auto: xHC error in resume, USBSTS 0x401, Reinit
>     usb usb1: root hub lost power or was reset
> 
> (The reinitialization usually succeeds, but it does slow down resume.)
> 
> To maintain state during suspend, the relevant GDSCs need to stay in
> retention mode, like they do on other similar SoCs. Change the mode to
> PWRSTS_RET_ON to fix.
> 
> Fixes: 4433594bbe5d ("clk: qcom: gcc: Add global clock controller driver for SC8180x")
> Signed-off-by: Val Packett <val@packett.cool>
> ---

Take a mental note that this is a workaround and one day we'll get
rid of it

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
