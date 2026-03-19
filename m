Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610973C3BFD
	for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 12:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773925081; cv=none; b=U76Jp4V2PkjGFYYxlOzBkaydegqWqpgxZ2CCKHlV1kVni5ODmWKDvaGs9koPUJr7S0g2a9NOoAD2qeRQtEJUy4XnP4fnYxZBdDNr6FBtdeS/C3ajaiM5f5Q1LI/Q6tXzR+hzaJm/RXBWsYcVBEQ/iBTqAlSpv5it/cXQIUApZ6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773925081; c=relaxed/simple;
	bh=zIvYJTY6gH0tywfJsDr0iY9gInR/p8kKtR1ilofgYwM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N/75xrwxcHM+Cbud47rloKnEajuiN2KNVbSL+hV60Mnv5XHMHe/JIifTIRpIg7vPSmv3FtI5f3oSKQ2OjWXUh9077/T58+z/2u4ENNuAelYlDiI4POlJ6bXGaDHiLSdLAwix17LbkeNl50lGiHXzCOMPzl70zJc6mvpB+In6ZrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GT0iLIPv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EPvypnVS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GT0iLIPv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EPvypnVS"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J73uqr1770574
	for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 12:57:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MfuF/PlZWMgF3ErD0zfEEpE4i/iFIciw6YjqRozDOSI=; b=GT0iLIPvcgEkI18t
	RqrGsWYCMxUKkcGWtFcyAqOT4bYfG28CXoZOS4g8py0AKbM8x3FzpxcJh7rH5lZN
	1MVc/LAniCBG+d3D9kQb8CMDr3eT4EnvZ9m41mInGtzhlzo1SQF/CN1ws/Jz9D/O
	+ypAokzAg6PC5G8db0mBkPTpyjBq1usKy9ED+nT9V3zWuZYRDD8u2N2rlLC8vf9b
	qN7XrQF/MBm368nXCsPo4M5yp7MJaSwYtpZaOfRy1Hw5CknZHzuQx9o7V7BQC5Yv
	dg+2X0ZGtJ65SM95uSxW3JONEUBj5TCoLKWIqsMhvyjO3gTiiQCbJxyDs5xZXfo/
	hXSwGg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyy75ufpc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 12:57:58 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89c6717b74dso7123506d6.0
        for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 05:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773925078; x=1774529878; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MfuF/PlZWMgF3ErD0zfEEpE4i/iFIciw6YjqRozDOSI=;
        b=EPvypnVSZauC4qxBqMBZ+a6CHwUtTH6Dd6X5uXQ1QH8v+wlgPtjD4TyioThyb7X4AF
         9K2zJVX/nDSDWOSa6uBjGkTGmD2LyrE1kK0QJdfxkOLYooFQJsMCsMz3ELG3HOD6nId3
         otRwbtgDjqoWTgSX7YbNlovrriJQ22/MOmCwmbgonvqP3wi67UnW8Q3PD6Eth79nnTby
         IGswTwdEqpvCiKbTPeUG8e5uhLGrcOa8usHcNlPccdzgcOV4Ft7sZ/fTWcKw27Emfy8A
         QPaMetfGLdrmt0IajgckjP9jEmDxzkBRIkcf24qRPHh2vwwi63hHiHOXsAZiNK+IH3uQ
         UXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773925078; x=1774529878;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MfuF/PlZWMgF3ErD0zfEEpE4i/iFIciw6YjqRozDOSI=;
        b=DSSFmrb5ik+kNUsj+HgBoyW2ohDwevouOyxirZpCR1443v00td+xMOkpVP8xYJ/dKo
         jCnV2FKA5S9Ad4q6Cxk+ksU9Tb65ysmliESQVO98gBo0WNQn9p7VIUSkAS17VPmRWPb/
         Zfn6mEOfSZrJTQcvWlFttZ8q3WzmBH/gCfV4+QGg86QWswYTKoWDfmMGg5DfMyHhOJt/
         BCaO0TgDLVejWdjUYGHOsQgO/kEGmL3Ur6ufKmqF46yMofdggJzBiZZd8a/wH5aLWCX8
         jCIfYVuWX40yr6IL0xfxr4qyNNq286hefgS912PXkyQK+yJEw4tabnu7FtjMl5xPPQfv
         PJXA==
X-Forwarded-Encrypted: i=1; AJvYcCWV3sn9YZDRMNR2ORDYgYy23rsQqqDrbcE+S8MHfaYNWHAxXbj4I7vR4CDxlKTMDIJmBPi0XnqXqgE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwX7LEbDbRdKuz/BNdr5CUpQpMYDyyAbl7VafDIZJtbw63lfBDI
	Ep8oNaN6ga1YXECgLPX+ppZrMjTd8NZf3hZ/aunRHrLql2HvGQvzluCMpKZzPmKvs6EJPy7gdK4
	z7nCMvbVE0WcJWmYYOBKK7cM5Hh1Rg3ApKqHQDOnauMdlae+cPXuiFnvCG5W75SE=
X-Gm-Gg: ATEYQzxFo85yvRxDup2cwfnGwYRCwwWEE/0meCZOFk3uOvW9SH1VauY0FdmMrRqdCKj
	+8eSJGJaGdX7ZjXdJIZsdxBSs+iLTbrJYw/JqmIiOcPNS/Ese/PTq6J5eOCd8s3qpptBkYuWMOS
	VbtIzOOVRB+DgwTrml32Pk2iNsF+UuSnu9B+DuFJjfITUwQm+WMZQJPbJwqYnmb5M/UY1PFwZJN
	Nu/9umWpi61XNrklImbRVa8jfkz3aNWnRQb09mHlDzUMB/tx6379/a9wcEoNvDPgs0EU6g04hZl
	nlQV6sDAHZW6BARsR/uVB5XtnyJak23GSOfpIzhvxEvvTGJ9Sc2ciIfEx6bOosaBtVLEjXfKv9p
	Kk6uCQ2wAxh0pdSqvdyKu92XPvyMdj+x3i1RYO8HkKBY5v/LVszjiTnxLGVry9jfvxUUV/k8Pfn
	dZTiE=
X-Received: by 2002:a05:6214:f2e:b0:89c:5159:ea52 with SMTP id 6a1803df08f44-89c6b5c8893mr82541586d6.7.1773925077666;
        Thu, 19 Mar 2026 05:57:57 -0700 (PDT)
X-Received: by 2002:a05:6214:f2e:b0:89c:5159:ea52 with SMTP id 6a1803df08f44-89c6b5c8893mr82541176d6.7.1773925077104;
        Thu, 19 Mar 2026 05:57:57 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f142a785sm449977466b.14.2026.03.19.05.57.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 05:57:56 -0700 (PDT)
Message-ID: <34c67717-0d6a-424d-be5f-0e514b71d180@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 13:57:54 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] clk: qcom: camcc: Add support for camera clock
 controller for Eliza
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com>
 <20260317-eliza_mm_clock_controllers_v1-v1-6-4696eeda8cfb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260317-eliza_mm_clock_controllers_v1-v1-6-4696eeda8cfb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDEwMSBTYWx0ZWRfXzGAZBYNwYQm3
 gVDXqUwmxkptskX0mSVDNuq3DSWBhE7Sb4r1mmSXUKNBnZDBShgZrXWHRjpDY6xjNMETyCAixkz
 DwRmCZNlgfPuOiF0XqPd+GEhtL9lC2Or5lJ3MQ8/t4kDXopL7t+bohzQ6NHm6xvN0ZBhCmJ6Gn8
 XskS+zI0T+A2Sdk2IdBrgBIPVudkZv0Qkp+9lbUqyW2jdqBdazyGa3l83YfCeR+eDzjRqsvJILI
 bBjhv3/5VVmQn6XTaMEd7mbtxj0zgIBbFbCT1mqOb3aFd5rrxIRo8y7G/75k+Pkp3yPE81KmU5S
 RFkjVZ4SaTkpJ6yO/zHm9sIkMOlI7dRqL+LheVnhGcL2hCd/eqKN4bs5nqH4zGmnrtyYQZulGFA
 y2sYyRIJOqwuSUw87PCYVpozwdghc24olpE9WLCVEdyKjRkNpBaZfqq7fqjq287SEkha9GCpkkL
 /6a7UUgCzvm5Sz9RLVw==
X-Proofpoint-ORIG-GUID: k-aeN8tvVFrCVA8YB_-wuni_hSbo2SDe
X-Authority-Analysis: v=2.4 cv=A7hh/qWG c=1 sm=1 tr=0 ts=69bbf2d6 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=jdZfh6YgxIVJxXzoon8A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: k-aeN8tvVFrCVA8YB_-wuni_hSbo2SDe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-19_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190101

On 3/17/26 6:14 PM, Taniya Das wrote:
> Add support for the Camera Clock Controller (CAMCC) on the Eliza
> platform.
> 
> The CAMCC block on Eliza includes both the primary camera clock
> controller and the Camera BIST clock controller, which provides the
> functional MCLK required for camera operations.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
