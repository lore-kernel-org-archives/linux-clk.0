Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEFE3A7F47
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 08:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787559156; cv=none; b=eCyNOP2+QTW1CRoCD7qkvgoHLncu9jGoP8GNx5w9wz3E9M6QsoU1oKjbhlQ2y52OiVcLMchDMGwqfUq6DGg12xuyr1UI48M8HEoxmPQNDrmS+FN+GyDVofRt3dR/aTxq+dlPJWk6P0HVlEJldPlUlxWVYiNdQpIIc0AolLAsCpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787559156; c=relaxed/simple;
	bh=lh3Tcxk05NWD/OL5zpuX9U5hLlE5hZNfVWbxM/kIojk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M2Zm0HNGRE36VzCsMcxVymgkoc6xCuUE2w7YKs6ASueDMqHdOperkXpeNg7lO3P4JsGYk4zeh/K6GiueZlV3vCjm9MLaQY6HF8HgDsW96h7DKpFPNqOPBTbN6SprEP8tENL7GM6fsE91MV0s6qEGAURAJOLx2NDAsnarBxdk4oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M0HEcRxn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SbSz7J0Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M0HEcRxn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SbSz7J0Q"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O8BTBQ2315573
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 08:12:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=892U6daOvBsDZR/zID1RaXZM
	26ByMlYVMiJ6EGwCtoU=; b=M0HEcRxnYTnuDgshBZa78TjUPXutXkHGE6dZ+Nbr
	z8VHGNp/oyMPgeM4FioL7a8CgUPWwdzYeG5dle8pCrM4oNmHMI73dT7t5nw9sMYR
	wXOoFreK3uzTlhp6QUDJBq/2e+gj4jOiXRft4WX221wbpoFgE0YeBLhHVt5x/Q9c
	GzowvmJHn+iuRDXg0INOTn712CQvJEHBe4FJcNnki1PmAIKEq99vLHnNkW8325Fm
	OxuqvKeMPQkqlKhVejOMfTFD2NOYvI7cD3yCdmbXWS+zFwDXVcL4sdbyWVkiE6bH
	O02CSPNtZegcdOjJzr66COpyDH/iKgA5Nkp8onXLWNQa7A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8j7r005w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 08:12:34 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52ce64c41efso64651861cf.3
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 01:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787559153; x=1788163953; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=892U6daOvBsDZR/zID1RaXZM26ByMlYVMiJ6EGwCtoU=;
        b=SbSz7J0Q/3b9+fDF23H4i2f9UKqN71CjpRSmXRShkG4mZI4zH4kzwWXU2Zn/2qEYWm
         bO0CQbIpSf9jIJ6+PC2wwcxDv5Pa+xTnHVEqBcWBjTpgNUF1+WhGFEtaZ8K88+tvDNrV
         tR3bpKBEf2G28p0r8sxYI6fcExTQWqHgm/MahGS9Pj7zzSID95xNeYa0g8fMXrQEz0hp
         Z+fdur1MVmqPFnH6BoN6CPEPdszqVmhpS2T8jVDhOGzj6dB2mJBkMep0dI9RRDDiSNfb
         rrJC3RExnz8fPjOJ/IjoYpM93gxds6GITitJs6fZgg6VMzkH/6fAZYPD/2nb+/94ssOt
         QDbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787559153; x=1788163953;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=892U6daOvBsDZR/zID1RaXZM26ByMlYVMiJ6EGwCtoU=;
        b=Mf2O0Y21J6C3U3WpIbVKh1fm7b+6OWME0SuvgV2AgElJCa9hTm89wKpPgYrIcaUyCr
         Qs/sul4W82H10oJvk4XHQTaeFDzmEGLO5V64z3LNlfmMKegP3VBAvUD9EngMGgfSq256
         q1nYfCXR0wsssHxLO1Rag8333dwSkPM2/rrIFYvMFG1PKPPFFWxVCCynnhU49wVmTQF4
         l6IkaK9R91BMY1+JxFOVD4A6sB/JEykHofCi9pB/VCIOCmD6RLNQDsQ6wDEUNr6C41gz
         ey2JaYQq5uC/QIBt2bAgAJMBHtxYklqoXVmAfw4fXcomZvvfYPBYo+cfsqtBfNNLO4vA
         9CIQ==
X-Forwarded-Encrypted: i=1; AHgh+RrASAmpl0zpFiLYZ9D9AWVeyCy286QmT8nrXgdZcuvLqYGMBwFy2NDl4Y2FRKYY7oaBgiGMRVsyDFM=@vger.kernel.org
X-Gm-Message-State: AFuF++kRYl1z4CrO8gQNU+5afdw/mGvT1AUTuurAnHAfFHgNAaPXXy7k
	ktTJtY4M83jrx7kVu+cmgKep28K1kkNuKGosAjL0YtswV60dB7AQmcH3avwp/9t6Uz/exPcC2Ae
	pqUFTvaycxa6fmSPFvo3PwulWxf358G8qyIABWOjRbs/h17s68LCfVt+kFwYT1lo=
X-Gm-Gg: AR+sD10Qxek0YFC+aYrQq/lpim8v4e8p805RsDoVoA+UL5RwMyy1vHYIf0LwsT0AaLN
	X5rUp8wRtjL1F+3Ok/aZjiI9akCyRBtZWqsfNsdDIa9vLAtRf2BPtxNYjhsKwnovtJdaPh7oGWM
	+iqI/XxjpMSArKnA2F8IgFfZTErOykbWLqmbfUMh4hmtKSwka2FNbkGiTjTM3FQmSKek50p+8fu
	LJPIt+u/JXMvKAs1VUiC9PnTKkzinlctQmd+caMnspTTq3lI6ZiPLRona3Z5q40GZ8b7pVH3yf8
	J+iEQkHguF5JT2XCGAkNuIsYYgSIlsRvVochK+UKzOyJ6rrF0ZLZLZy6ZtITW9dV1j07rCZkxxo
	MGD+ItXlGFDBHEoU=
X-Received: by 2002:a05:622a:5143:b0:52d:9dd9:63bd with SMTP id d75a77b69052e-52e09bcd449mr160083821cf.10.1787559153549;
        Mon, 24 Aug 2026 01:12:33 -0700 (PDT)
X-Received: by 2002:a05:622a:5143:b0:52d:9dd9:63bd with SMTP id d75a77b69052e-52e09bcd449mr160083521cf.10.1787559153095;
        Mon, 24 Aug 2026 01:12:33 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24d6f203acsm108824266b.24.2026.08.24.01.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 01:12:31 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:12:29 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: segcc-nord: Add EMAC CNOC APB clocks for
 Nord SoC
Message-ID: <z3d2awmpulr5cwexhso24verb24ec4rsnj4pxfhhqxwezrfjat@pwoxszguelpg>
References: <20260824-nords_emac_apb_clk-v1-0-290767386bf5@oss.qualcomm.com>
 <20260824-nords_emac_apb_clk-v1-2-290767386bf5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824-nords_emac_apb_clk-v1-2-290767386bf5@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3MSBTYWx0ZWRfXy48YsbLAa9mc
 VgcUAsBmE2Cfty1dvTQW3zeUXEQjbY0VbpKFvmOt8Zdl7PPRKu6GonmJVLGeqiZTTKRS2hoLpky
 z0l6Ciy7QuZ7sS7hj9yBUDpclIWnA0wHYvPDxdIkyLoAg8rrnXBqYYwCWveYIn6lW74oDCWnR8j
 rD0sQ28be1kci3aAhgy7xnOKovcea0gopK19gg76mIgYKNhntTBNWYB/p198L7ACiM2sjzd+aC9
 dpqE/BzE641+XpG+JBRmHbXUhAO6W/NJv00OspgGw9xxsY94AuRJRCwYyFINMlbf9TVM05AbFVS
 l7zU0J+Z4ZDb+Ow2ZfzcmHlVTmHIF5we64IqJB6LUF/eVm8aWuSIjmsvlpZ0+37tNN0znw6pgcR
 kV79jjgTughMSHeVYoatsE/5FQr/d9ak8oxI3zPonyf8YhOPk6EYSqsHHCVseIfgQG8uhzeJHMi
 uWEu6q++oKHzScp+vGw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3MSBTYWx0ZWRfX+9jD9Yq9q9pr
 HTLEcXGxAPUNsJAGV1S4FzRTFjr4hkL4Y2BhKe28DwpitgiAGjXKC9ki/Jojrcr4wHBCwi5GI9O
 WlzvKqL3DDg6hvLp9SVbsYwvL2Q8G60=
X-Proofpoint-GUID: KRkbxVuocNzltGig-aMyC2cGBpMG1iG3
X-Authority-Analysis: v=2.4 cv=IL8yzAvG c=1 sm=1 tr=0 ts=6a8bfcf2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ybGuUY0XYtVVdYjWugUA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: KRkbxVuocNzltGig-aMyC2cGBpMG1iG3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240071

On 26-08-24 12:23:30, Taniya Das wrote:
> Add the EMAC0 and EMAC1 CNOC APB clocks to the SE_GCC clock controller
> on the Qualcomm Nord SoC. These branch clocks gate the config NoC APB
> access to the two EMAC controllers and are required for register access
> to the Ethernet MACs.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Fixes tag, maybe?

Looks good otherwise, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
