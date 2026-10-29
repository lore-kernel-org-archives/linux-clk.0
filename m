Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793261828;
	b=ABt/DxsEy1zvcRoU6V+U8Aezv9P6+CyvqG51ggt3s8x1jfMHOlZuu70fs4VEMoFS0X79
	 EzlpODlE242bHMNbhROUSwdzAMQrK1ie6hAM/hyAHfo25HjhuYw45sQ+ozI/yJb+sCsnW
	 kbxR4X8TmUagq4djEWciJNKHCKDZlUrcLuX0mB5XZhVhlTBL0B8l0bzMP9hqOOMlf4ejb
	 CF/Qudg2BYo4sR0CzwjOBAC5zrNyw5VrtKCToGmkW5enNcaq0lfyNGyiyFYkky3cU7HFf
	 eUl1mLPhT6urfJ7E9gYzfHM33ie07FZkMNHPXE23wEnyHZsW72jNxrqurwTT2eI1azw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793261828;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7ObgK3uRV6cKfVdCWUDrdbBkGrdpI/d9NpKlEYbNlCY=;
	b=qtajptg6A7i5pW6reUleHaTbqiiOWeDLwwVzM/biFnHDIRhX8IKcXyeNt2MwqDN4/k5F
	 M7DlVPxgNtipK6UlEuMr4pe2YQ9rYhRxj0qzYGu5MFTtv6eCznpF+9SlGq/guBKrJ5O1+
	 5VdeCt0oCdOoUIG4KO+KxflbPPSx8VU4p13gT1+xZfZrZBp4x1stdkLwqe6a3TdBNfi6j
	 fTc5tmr2sx0WBPC+9e433J0YcHBKmtDAsxW0morZms3HKX9nqgY26Cvliqqduzx35YKlx
	 fL5ea/fmgE040QiFxV/sRbndBvzHDXgDzKXA8ZcPRZlrWJK7FDRXPX/3LTThnWVPaoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B+v2pR7d;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eBxwOj0v;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDDA606A31F
	for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 08:17:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CDDA606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B+v2pR7d;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eBxwOj0v
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5Guvl3341092
	for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 08:17:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7ObgK3uRV6cKfVdCWUDrdbBkGrdpI/d9NpKlEYbNlCY=; b=B+v2pR7dsxQThfZx
	3QRMLymhTtIcqGnFnLyXGHkJbnbq6y7tpz6Q574+9/GIpEDUkQEyTy4dajednGk8
	vJyfyFcfLWJjYmOHzde1tnW+cawHnUAj6lPDREGdbqSYTUVOvUiLD8dyg35bykLi
	MIicIhyI8929VKnZ4L8cfchr5oyfGyFkZO/l6GkFfxv20+rZtCgSFm9DssRflYIW
	Mmwcy0YKlJLhFVc8PzBCZIbtrhqGHJkA6yuZamFB6Fx8nRE/2/d//1abwZJJzqxd
	Fc51x4+zvTbfTxHj32SjtpF01nYIC3n4H8AG2mfbXoNqUq7FWsLU6TSmFpR1xjbj
	b5payg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkut3hdpu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 08:17:06 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91c7047e84aso4834626d6.2
        for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 01:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793261825; x=1793866625; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ObgK3uRV6cKfVdCWUDrdbBkGrdpI/d9NpKlEYbNlCY=;
        b=eBxwOj0vENd9D8/fdkw9NSIuAVDs5RrxbMDsCtyVNXqT4a60n3pTKjh36gZUYnX44Y
         EDNfTxjownEwwuv3/DxGqiYnWFxOYm9Pk+JLzQAii5P2vb16WEBaxHFfVCiHdh738+dv
         M0xN+K5sxQesinEccHr91kKJF/3ksF3I14INlxZ0FHAIkj/p3SL5O3YG7M85rTjDGZNz
         47/jq6K9F+50e//f9MQdLOo7vp1cCDTS2oIKhS6AlTeaBtMvDW/mA1I4NxQQ8eGuLlMQ
         PfyB5tz5mDSbSt0RDM9iiFdwgsuVwI3GQMzH5WhPLro9fwaKk4fTifSRHHMfVjHrBt4T
         F6tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793261825; x=1793866625;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ObgK3uRV6cKfVdCWUDrdbBkGrdpI/d9NpKlEYbNlCY=;
        b=ESzJpg66F1fpdzd56jIODNML2oHsTnT5VcP9ZFdxSYg2+Awb+wR0vB+in5has3aJg2
         Y0NoeOIcZwgHsBidO9Sy1T8gNK6Iw3xEkoCejntQKWSXCrhUEPijs8vNzgDEbr7mGmAN
         TI8rgmAZjbjhz5T7e1kvCX75FFNZygser0ZobsSm2VYnB1bDnEFI2Pt/MbHFLkyalOyv
         /k12aKoStfMigaXbF8QUkJn/wUwhkM2yfgBMhKpXFAaF8gDE22UZBH67I0rsY+ppU3zr
         07CUCG19LfNF2/5vZhYLyNSBWdQVklN6uBR0HvLENXQDIa6blIau6Gy4bw9WBRQF5Ljl
         AbzA==
X-Forwarded-Encrypted: i=1; AKwUvBw1RO2oh1KJFh7XLKqHjd2dbBBM3/83CdA84zgPJ+X6U0R3jZebOWX2EFvyVqdOWuJts/IogQUTnuM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLEqOY634h4uIfCivCzyYWpI0VCUwF0qk722waWm7ZE+bJ8Yr2E
	cXwKxtPc7cuo3NIiJAQUuKFOKA1NhctzxMCMvn0hsVWfO0PR9i00wnm8jZyJsEms5v85TK6t83i
	mQpQsXUMzZmJn9gHRCTbPNPhdAoPAZfcoIaNh6VnaDKpkSP6S5/X2SNkaMj5+OtM=
X-Gm-Gg: AYBFou3DSltUPaRDcIIl6WVuEcBUean/fBeTbTdu2XX3n/wadBU5qfl5iOC7mrH5oum
	VJLSEJo76i0h9PzUvTZ8vqjSIYU8TjPJviriN+1wG4MwsgDHkSWNWWoYDnymbaqxRvKAB/dMxDX
	b7BV03OfNbVrMV2XESQL3pALuot8oI0fVimHUf5yElbwQQELq6ue1x+PEy7dkkLr6oNbddEfiG7
	0SWPz5M4yarGhV2UxI+fI/ZAh5zi0nGUdCWVz2OUqZji1WEvIeySq8WoxGpbmOo4iha4t4DGjZX
	EfGfhipje7KNJirHI1drI6ETHgL1BvRGSvi6NyroNL3CGq78ZPbgetULjawtfNEA072Qq55/VWR
	ASXEooKbBSTgbqtp+CZOalB2jv20Wgv60fK55EgssAKKdm7/IVaPoFtxuBku20gEytB57XL0=
X-Received: by 2002:a05:622a:e350:10b0:536:61d4:cc80 with SMTP id d75a77b69052e-53fcc9bc5e3mr77695631cf.5.1793261825230;
        Thu, 29 Oct 2026 01:17:05 -0700 (PDT)
X-Received: by 2002:a05:622a:e350:10b0:536:61d4:cc80 with SMTP id d75a77b69052e-53fcc9bc5e3mr77695441cf.5.1793261824787;
        Thu, 29 Oct 2026 01:17:04 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd35004asm695139566b.4.2026.10.29.01.17.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 01:17:03 -0700 (PDT)
Message-ID: <c5cb80b9-6a5a-4762-8a8e-9819a09dace5@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 09:17:01 +0100
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-sc7280: Use retention for PCIe0 power
 domain
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krishna chaitanya chundru <quic_krichai@quicinc.com>
References: <CGME20261028223455eucas1p29b3028675c392f6c0ee012f08963ab3f@eucas1p2.samsung.com>
 <20261028223444.2683120-1-m.szyprowski@samsung.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261028223444.2683120-1-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzMSBTYWx0ZWRfX9aClLk7P8+Ye
 XZAsLaVrgJB/juY6H4/i8/wkMW/4ngsnXDTLbauH8tkh2OADAkXniPlanDbv2AHfAg+l0F9d+ar
 JpILoSfoMbcQLjim/QmBuCMEZGLuDJE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzMSBTYWx0ZWRfX1A+cUlYYBd8H
 woaiyf8C1SSxw6OVVM/gHifcHy1JLwBgAoXIZMRljR6MMlV4I15/SMV6O8a7Y6YX87VLGCH8gD7
 0zC0PSRG6/F6YE1pfkhWWL8dyrlE0WRSdrbUt680rPoxXjAM3MuwIQa46p7vM7UDEeDYYc9CTK6
 hRHxgFiB9n3irwVnTkU5n9xq7jlo8LWfh9ZFgHBQYOwbGD/hFXTWLQW8l+NuInpuFQr4uV9Pm81
 K1KoMFuyH+Cw885yBoU61NHlOs3eqoxDcT3zMihpJ1dQpKGtjAISXqjt2R6nKavNHFzYcDHxSW7
 StHXxW04SJ3dylDyFywkDW4wwByJlkMSHizYq7Mzg41X2k9oj5nGaopzeDKKivZlntvbtuwIdAP
 ovPQAe6jtfxadvavqyBKIX8UueF6dlnl5JVpcne7xf5su8w1Rl/uMkb8ZJhjr3bTuAYi0Cg48hv
 8c6veQwIoPYasygwcjA==
X-Proofpoint-ORIG-GUID: bZvEYc5mqSJbn1XEE7ZtpzmmUDGDHgOv
X-Proofpoint-GUID: bZvEYc5mqSJbn1XEE7ZtpzmmUDGDHgOv
X-Authority-Analysis: v=2.4 cv=HYSB3SE8 c=1 sm=1 tr=0 ts=6ae30102 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=hD80L64hAAAA:8 a=EUspDBNiAAAA:8 a=NePJl4asqtF8pCtaxCYA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290031

On 10/28/26 11:34 PM, Marek Szyprowski wrote:
> As the PCIe host controller driver does not yet support dealing with the
> loss of state during suspend, it keeps the link up and the resources on
> when an endpoint is active. However, only gcc_pcie_1_gdsc was switched to
> retention by commit 1a58ee1330b2 ("clk: qcom: gcc-sc7280: Update the
> .pwrsts for PCIe GDSC"), so gcc_pcie_0_gdsc is still powered off during
> system suspend and the controller loses its state.
> 
> On QCS6490 (Thundercomm RubikPi3), the Renesas uPD720201 xHCI controller
> on PCIe0 doesn't survive suspend to RAM:
> 
>     xhci-pci-renesas 0000:01:00.0: Unable to change power state from D3hot to D0, device inaccessible
>     pcieport 0000:00:00.0: Recovering Root Port due to Link Down
>     xhci-pci-renesas 0000:01:00.0: Controller not ready at resume -19
>     xhci-pci-renesas 0000:01:00.0: PCI post-resume error -19!
>     xhci-pci-renesas 0000:01:00.0: HC died; cleaning up
> 
> Use retention for gcc_pcie_0_gdsc too, like it is already done for
> gcc_pcie_1_gdsc.
> 
> Fixes: a3cc092196ef ("clk: qcom: Add Global Clock controller (GCC) driver for SC7280")
> Fixes: 1a58ee1330b2 ("clk: qcom: gcc-sc7280: Update the .pwrsts for PCIe GDSC")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> The issue was analyzed and the patch was prepared with LLM assistance.
> The fix was tested on the real Thundercomm RubikPi3 board.
> 
> Best regards
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
