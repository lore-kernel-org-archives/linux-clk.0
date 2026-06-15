Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8613D47CE
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 08:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781513490; cv=none; b=f35/tz1O3Vq7+TQYx+eRJtY70z+u91sKoqQjC+/ZWU8NSOQmB52LlyCdryhk8lWden+mj5iDBUgwTVMsqFe3qdbvBl8tHTGiso+yhj0gzub6+hC3T+hlk5VAsH86HbGqooGyXpFKGFgCQJWT91Yd0zMRJFNnBXixxuBeb0U+qRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781513490; c=relaxed/simple;
	bh=s3YPsS7TYXOkNKykf4aKHwJBdJUL1KkEkzkYprblN7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oY8/A/3xwxl7h4xKtuCGyGYjpN4Fjw+TRsvuafBcMf8VSwbDf2DNWkkQYHpDN0mwvbpmYMRCEERPjxphoVmsafIiZp7KID5od9qTyEKiKYNrqGzxm708sdVLPhQ5PIPUOH2CHrc3+JoriJdnHjQmZnPdxy92W9h5PyCpiCqUpns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hl/Ye/73; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OYH0NyqQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hl/Ye/73";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OYH0NyqQ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6IuZT3332556
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 08:51:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TY6bO/ZF34WSseauS7TpJELH
	kVqlLrjKDs2OgzBNdv0=; b=Hl/Ye/73vX1dcRAZ8f+m6tCwMuKBC5w9FXTPrNl0
	8JsuMq5AfBDbeXPO/IP63zrL1G7SeVlSAgR+Csy6DCF0noA++rMCtHVtgxamf1Om
	CBLtEcOkq++ctSCJLxSB3uSQPSOgbZaRx+q1r0ij9DJgH2moEPSBQpe6463RWwSg
	B42vo38zTqwj56tZCBydj6DHteNFydHUp6++GQ3mFvWKvYhlU+A/iVcSQNfBC9xi
	QKOYtOYzPxs8S5nyOz/wZ4Cm8ip+SH6oq7lAqjS3bvP9HGz15NADWIZI8V+I2tTw
	psmL1VIMNQ5x42zD6Q0WVZw6fVTrmANfO/YyXUmaamEjog==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4erye16jvx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 08:51:25 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-137fe4a3640so4591068c88.0
        for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 01:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781513485; x=1782118285; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TY6bO/ZF34WSseauS7TpJELHkVqlLrjKDs2OgzBNdv0=;
        b=OYH0NyqQ5t7739Olv7CKvu/Pv5yfoA6/T/LYIccY7hCT/Q4AWSc2MkuYFttmhhp8uR
         7k7e+XJF29cYGcJVghTwIJG3l/0O+nF0zs3K3+7ATK62pNlCP71goT0hXSQeSx4xKtX9
         m8zhmdKMpYLWj6BUOA04zkZTtd6yqmlwwFqAEK/qdU/fgeYmUPfwzjEZxqsWUKhr/HOv
         J8s+3OoJmFbWgS3W7UJ2/E7SZnylIZs4lhmgw0Vb4qkdhpHLp2ZEY/+Svx9md33tdSmp
         iOqqIScovkTdK2XbtVFMbqh6q37vWWfwwfvI8d0aeVQIfZbZckGaNOvopcKTfqwLmXa6
         rROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781513485; x=1782118285;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TY6bO/ZF34WSseauS7TpJELHkVqlLrjKDs2OgzBNdv0=;
        b=l320DEu60jDkr8sF2K00MCkDPHcAvf6pHDw2lgifix9EHk2/RKa2TgD3V7EqlBaFMA
         z0xBLoo0rVLxvxQcR1MVE0oP2eigCR3jpFfteT5R5oEUWVIVtRFHVRYVFXjAXQxus+dy
         ErgQoTFKDovOjjQjlRJFDohKm9ABPZ8so2xMJpjdg5ZdcwKFVys6VcNZIu9VM2ag8rLU
         qKeH9O5O7gnuV0dzuASom9lbpqAbICZON6TiATj4SD5048WEX+1DDWNLl1n2jGtIqMbc
         8GCcJ4v9nWmB1Tq/yXUl2PwUjR6eK/TA3novc13TzV2FE7PVQR8yrivEJiGs90v5yj4F
         UYuQ==
X-Forwarded-Encrypted: i=1; AFNElJ9PQwdJcymoks6CMqE4jsmflMOC3iFAjkoLrmsLR6q82kfQdR3ptJ+BoYWz5hG09yy6c+s0tmSXKRQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3dz/eqxqppr+pvVPs/OLYyvXHOXRk83iPEDO/IH/oWrYuW3vd
	MoYH9JCcYhbr9o8OhKap645jnFQ2sh3hCZd37/B9y5D4qiLxdQs3JYM6LQCfveCF1NIBs/xRA6i
	50emQsVmDwtgunVmo0CL53nxgv/n8mbRb20MG6EiASRk0o2GrKqEvfuib65VgR+g=
X-Gm-Gg: Acq92OHOdV0xcaHVUSKKn6y9ip7niHEzLTPniuIsLD8kryLKZhVOKbE2LPOzPrCDM35
	S2n7y7utM7aFdEovmWdqNO+fJYzBPOdLoo2fFmnW4rgKeo7A5EveyCl5v3UghKE36kCdLsm+f1G
	uk2eOQhUIieaXZ2Rjd+tvNuFGIy5Djs5j81D/p9aUJ8bajQ92s7Zm4tUFaKdZ/+tqNO558/9JA1
	GQUXtUbaqvQ+4XS+wVz1lYn1SA7rXJwBQTOqOvlEt3gQKCRcXEeejscBYhgRKKk69ZxxFRRU5ZX
	2RibgGrOYJHClUKhFI2CrK7vZfD/waq77hgHP25dCyMkJJwsfdEaE07dC+W2vNLguexxVykWxad
	kzLImWCFLRySoptkfWnkzdrFUlTnFbjrToN+WQ1DJypDAS/xa1s9MZGUVO27xC+wYl5uF
X-Received: by 2002:a05:7301:1e8c:b0:303:f2fc:c483 with SMTP id 5a478bee46e88-3081ff4108cmr7650471eec.1.1781513484567;
        Mon, 15 Jun 2026 01:51:24 -0700 (PDT)
X-Received: by 2002:a05:7301:1e8c:b0:303:f2fc:c483 with SMTP id 5a478bee46e88-3081ff4108cmr7650439eec.1.1781513484027;
        Mon, 15 Jun 2026 01:51:24 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081ddaf69asm14766842eec.0.2026.06.15.01.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:51:23 -0700 (PDT)
Date: Mon, 15 Jun 2026 01:51:21 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v4 7/7] arm64: dts: qcom: mahua: Switch pcie5_phy ref
 clock to RPMH_CXO_CLK
Message-ID: <ai+9CYntPuyEEcLX@hu-qianyu-lv.qualcomm.com>
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
 <20260527-tcsr_qref_0527-v4-7-ded83866c9d9@oss.qualcomm.com>
 <db074223-ac01-4ffe-ae82-187ef0cb2cbb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db074223-ac01-4ffe-ae82-187ef0cb2cbb@oss.qualcomm.com>
X-Proofpoint-GUID: PDHNq6puRmzWKz5adnLWc4CtXDghFAcu
X-Authority-Analysis: v=2.4 cv=MNlQXsZl c=1 sm=1 tr=0 ts=6a2fbd0d cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=ZCP-bhYMSNivbHJuKgkA:9 a=CjuIK1q_8ugA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA5MiBTYWx0ZWRfX04xXMLRbHfUi
 wardqwd2RksLNhZ8g9P3EkG7qLHn8t7Xg9M1qwMhCPqUXGM+swdc441ZAJXWhBH5/KjQ31++CTa
 k2RHIP/xeAzhQF/iYNPggJjGkVtRPFc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA5MiBTYWx0ZWRfX6OF3X5EO3Al+
 Fc6hJGXQ8ivNGNKG8IR73jTvmyivYflJZG1+JksdbD09Xxew82LdwRpoVQ6ixymDyd4ukLR5554
 vSQim3zlxik+ZIZGvu55OdnOwV+N2pLYf9neKUnSxrFl8ezSJuWxaoFHHngjNo0u+Vy1vgGMZlS
 g0NnUSXPdNVpSLXfrrZorlnJF5TD47nIycQST3fUaWl5cRtHOaH/Sz8GZ9mlzBvvtp18Bg/4jfv
 x5T32GgUpIcqdGelJD8YPW0B4aauFUIEqVoh7TGFk5U6FALMEKy2txDOPfGPZJQSyGxhrkzfQqz
 M8acBQzEEZKSjehYLfSoylpIaXQSqcRqFRYz9mFHcO+xgeJqFT02OoghhZFqF17I2VIrad+kb24
 lMLq54R7J6fir8t4Xe9OOSoqOKJ1P7hjpmnKL1yQAyj6XoPSnsz6/Crdw/hKq8GMvljTfoPB7X7
 /2Q/0eoSNDPlcQ7OR3g==
X-Proofpoint-ORIG-GUID: PDHNq6puRmzWKz5adnLWc4CtXDghFAcu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150092

On Tue, Jun 09, 2026 at 03:06:02PM +0200, Konrad Dybcio wrote:
> On 5/28/26 4:29 AM, Qiang Yu wrote:
> > PCIe5 PHY on Mahua gets refclk from CXO0 pad directly, so no QREF
> > clkref_en voting is required. Override the clock list to use RPMH_CXO_CLK
> > directly instead.
> 
> This is the last piece of the puzzle that this series is missing.
> There's no QREF clkref_en, but there is a refgen that needs to be
> powered. For PCIe5 on Mahua this would be L2F_E0 (0p9) and L4H_E0
> (1p2).
> 
> I think the easiest (laziest?) solution would be to add dummy clocks
> in the clkref driver and only toggle the required regulators. Another
> option is to defer back to individual drivers (such as PCIe QMPPHY).
> 
> I kinda like the "one central node to drive power" approach, but I'm
> not sure others agree, since it stretches truth just a tiny bit
> (although not as much as one would think since there are *some*
> controls for the transparent-to-the-OS hw pieces in these paths still
> in TCSR).. Dmitry, Krzysztof, would you object to that?
>

PCIe5 PHY on Mahua does not use QREF at all, so there is no refgen for
QREF either. The refgen supplies you mentioned are for the PCIe5 PHY
itself, not for QREF. For other PHYs that do use QREF, there are two
refgens: one for QREF (voted here in the TCSR clkref driver) and one for
the PHY (which should be voted in the PHY driver).

- Qiang Yu
> Konrad
