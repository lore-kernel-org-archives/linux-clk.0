Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60C9326944
	for <linux-clk@vger.kernel.org>; Mon,  5 Jan 2026 05:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767590144; cv=none; b=k4EnLAVnsoaN8VblAQpBaKDx4zznmVBtapO7cKTRUyAPYH4nDqE70lN8MGZxDxWONWIzASJJP7lefMaeput48BdtJS4PU4PQmVD3EgZz65Dm8HQ+llll3zmMmXiXdG2ROoX9c67R3s4du7NHNHyN35cngxcqPxGO0HvTcJUPOdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767590144; c=relaxed/simple;
	bh=ccckinTe4Nd6e+DN+CiKqNsVaXVriV0JcN/wQcWRlKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ErteKBCswwkMkcCtt5cekwRk9alGStnOmvsq88oV0k0y02sRVzGxNJv+OdgLnGfQKwDgCgzMr4mx7ybuQdXALdaGnP0rTSlhQRJomtqa/qiqVrRBNP11I8oRd5NpL06zYoSBoWlvPOO8CQIcntd7QSHXxcivhL/z6nJ5uU6dJ2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cNP6SHZx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VuKgILKS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cNP6SHZx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VuKgILKS"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6052o5IN091251
	for <linux-clk@vger.kernel.org>; Mon, 5 Jan 2026 05:15:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w45yMTKmw3T3FsrBXK+GQLsm1qbLPVg5YDaxvUzAAPQ=; b=cNP6SHZxDAp7CWTg
	13K0Ub9Hwi6XGcb5BnYqF//HQp6S4+Y0Q4wuspF2gJ2xkwXVz6VKZWIV+vo/YRvE
	nBqiD/XO8oQ74NaXVM7eFKRoc8hCx+ZWNiYdW96vcsZxwebYJvNymRrRBf1N4btZ
	ND+VZV8FnRWE3j2Gcm9qqOfMPSqID0YfcTux8+6a2GkrT3LEPVLu+b7pxf+fz3md
	y1ZXUDUyylUOGwaXBARp0+6nTqkC4gbzOm3pPiu5gHZn3zBhRARU/P3BVkqA6pbU
	wVVRGvEUCViw9mEzktqDsna8227Cnx5HefJSJTzClEuUm759xquH+Rokb4sl93vf
	MaBRZw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg4v609xf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 05 Jan 2026 05:15:41 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34ac819b2f2so15186811a91.0
        for <linux-clk@vger.kernel.org>; Sun, 04 Jan 2026 21:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767590140; x=1768194940; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w45yMTKmw3T3FsrBXK+GQLsm1qbLPVg5YDaxvUzAAPQ=;
        b=VuKgILKS+CwCzLawbfpDOpQIsO9A5P1YwPk7F6TBji1ioM4kIeyGVHv0EHrsGGfzmu
         F93H8ViAtYd3FCOgclxEtWkH9no+iSNrCml3WzbUJIpuvC5JT6GFBdeIwtHR5fK4v0N+
         aq7KOLQUjXXDzm1YLS3kPSgWnFB6GnmFJ+hoFnZr43joz+Hs2iUBm35XD40GYXmi/qRZ
         Ze0yO0zLRH8IWb/xsW3xdT4Cg3vO9ylLPfuvJdvzrdgEqjxuZKnCeYk4Ok13SKDr6nFY
         gj9D7Xr0brI8s4KaGTwUFr5rOGn0vxq94RKuFUKXQLjcS0afgpSjP7m6BnYN+KyLUCLr
         AJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767590140; x=1768194940;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w45yMTKmw3T3FsrBXK+GQLsm1qbLPVg5YDaxvUzAAPQ=;
        b=iaTY8/1ymnVnJ2oXa56qAybcG6+3LR9ubZvO+0Ki7TnyzK/V94QBnlZ3YjGuB51yA3
         amXSoM891kis3h2D/pBJbjv+hqKUO5qY5ho7h4B2N4QJMoqB2F4t6wrvMqlFj6SeQfgJ
         yyw+Xobn7jqn6AdT5O8hzBZW0freAivF6lFA+Cn17CVUnRN6KZhs0tuv6+m+HGGV9r/C
         dkZ/68F/hZgIA8kCmc6UpqgzdvvaB3rCL0CUplGQth6jzC37h29H+0WZyKn7OSEBIVkw
         lzf4fXtEVtLCrHS/2pHDPmyhg/A8mhcU5FhQ6abdxXSVrpQOa8oOpXRfJs56UEjsOu8/
         MTQw==
X-Forwarded-Encrypted: i=1; AJvYcCX+HjFzRAsDZ+tR2ZjGe80njnVMFWlN5rel7K8+I4Wv3l1vIxpZ3xwUTpRkN66BmrfXMA0Jeb7j6xQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAbDPLk92xbnoNpa/d9P6M94r+OC3l+DyfL6+vgkFgGrbCcheI
	8XITLaWWTlFMtJX6kC67hgcComcvqk6tXP3hN1eLjHQ+1+dfTwItexqPzfK22or8jBaHuw+Jm/n
	j67cC8llVR55PKDsb1LF4wurK78E2Ytt2ZX1EC9XhB4eQD/6goRKaacVXoCVGd+w=
X-Gm-Gg: AY/fxX7J/suuH6y4OQwySdMiXvuxy7Qxsp9MhXfNIHLEZcn6wr2F8M2/kAfpjECuvyX
	eDN6mrxIRRpT4E+HDXv3WA5oGqy79GdlNk/92ebBn3UVPIiFFad07aj3dJ5/Gy2AidKCqpgox3J
	7qDC2a9Y7iAZ66xDbmfzIXSlF1k3r26bUVbzEUoXwHlHsgYfRDriVoCaHpMHcRQJIVXLMf9Knte
	IOKZmai+evfP1dFFzrsLXErRFfuEWMvq2IKSfONvS9nY0AdfVlyWFBW4WNTaVuZKkdP6XP8UkPX
	COf82xcgf6pFDv3bQWCKn0kpzZk1VZ1BvTECpGByYrJBjCOuGkwHvI4HXMGijFTDHSqaq0szUtW
	jUZnwPEhIgTZklIqoP2cDk+jV5A==
X-Received: by 2002:a05:6a20:7d9b:b0:355:1add:c291 with SMTP id adf61e73a8af0-376a75f5bb2mr44560568637.10.1767590136231;
        Sun, 04 Jan 2026 21:15:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfNcaMd2IHGrgg0+WgvXFUrvvd8fIzU+ttGMrRaZKzm0QUfBMuqUCbK1jhV254MgJ2Excv9w==
X-Received: by 2002:a05:6a20:7d9b:b0:355:1add:c291 with SMTP id adf61e73a8af0-376a75f5bb2mr44560548637.10.1767590135763;
        Sun, 04 Jan 2026 21:15:35 -0800 (PST)
Received: from work ([120.56.194.222])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7cb01a9asm40787234a12.35.2026.01.04.21.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 21:15:35 -0800 (PST)
Date: Mon, 5 Jan 2026 10:45:28 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rajendra Nayak <quic_rjendra@quicinc.com>, stable@vger.kernel.org
Subject: Re: [PATCH 0/7] clk: qcom: gcc: Do not turn off PCIe GDSCs during
 gdsc_disable()
Message-ID: <mdy2edlneqivwjsi52ildqcnrprbqc57ghtuwtc7mmuru7ajhz@tdo6jts52soh>
References: <20260102-pci_gdsc_fix-v1-0-b17ed3d175bc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260102-pci_gdsc_fix-v1-0-b17ed3d175bc@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDA0NyBTYWx0ZWRfX7sekCN56DnVA
 xNXVjyyTSrfa+kK4/6w0mRnpzDZrRMuUmpX5RQqKZzOjHCcu55EldKRS/6CwD4v+K2m4C2b90w2
 nVgVThnefZkZfYIpsTBp477z9lwHw7AUxnKMunQtDGLWbHw6H/Fr9lDkm6nrBCrpPpJ+NHUM6nM
 Xc2dOaZLMGaTzs26VkzdEk2ZJN1+8zZZ9AxlcNiBtrTlFU7/yiLFAINPG1GWlTsans/Se38HTT+
 RhsvkIs3nA0nGZSMFxapCl3Mz2QFKmzPxK1iShOnB7Fb6cPq7nO/xmbgAhZkjD2YiRqt8MKRB+y
 MeQlkE2Qs8CMnqS6zRKrRokHZCY2yhv07oL10ih7flMvlKB7yfZPpqv0yN4heznbdsby5vP81M/
 m8qHG3/m1PX+SfNMPzVp5YdPe/iRGLacbMv7W5U7nzZq3XJJ/LpW2+Jz9MI0GuWjH6vNlS1x1V/
 HaJUVEwW+UXrwBd52zg==
X-Proofpoint-ORIG-GUID: 8ccH8opX5GhrGvxthpmDgy_2fBRd23sS
X-Authority-Analysis: v=2.4 cv=c4ymgB9l c=1 sm=1 tr=0 ts=695b48fd cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=3dEILRYKsVIWdVk4w2Qziw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=LkPj_kuH23xJFnsvXP8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 8ccH8opX5GhrGvxthpmDgy_2fBRd23sS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-04_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050047

On Fri, Jan 02, 2026 at 03:13:00PM +0530, Krishna Chaitanya Chundru wrote:
> With PWRSTS_OFF_ON, PCIe GDSCs are turned off during gdsc_disable(). This
> can happen during scenarios such as system suspend and breaks the resume
> of PCIe controllers from suspend.
> 
> So use PWRSTS_RET_ON to indicate the GDSC driver to not turn off the GDSCs
> during gdsc_disable() and allow the hardware to transition the GDSCs to
> retention when the parent domain enters low power state during system
> suspend.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
> Krishna Chaitanya Chundru (7):
>       clk: qcom: gcc-sc7280: Do not turn off PCIe GDSCs during gdsc_disable()
>       clk: qcom: gcc-sa8775p: Do not turn off PCIe GDSCs during gdsc_disable()
>       clk: qcom: gcc-sm8750: Do not turn off PCIe GDSCs during gdsc_disable()
>       clk: qcom: gcc-glymur: Do not turn off PCIe GDSCs during gdsc_disable()
>       clk: qcom: gcc-qcs8300: Do not turn off PCIe GDSCs during gdsc_disable()
>       clk: qcom: gcc-x1e80100: Do not turn off PCIe GDSCs during gdsc_disable()
>       clk: qcom: gcc-kaanapali: Do not turn off PCIe GDSCs during gdsc_disable()
> 
>  drivers/clk/qcom/gcc-glymur.c    | 16 ++++++++--------
>  drivers/clk/qcom/gcc-kaanapali.c |  2 +-
>  drivers/clk/qcom/gcc-qcs8300.c   |  4 ++--
>  drivers/clk/qcom/gcc-sa8775p.c   |  4 ++--
>  drivers/clk/qcom/gcc-sc7280.c    |  2 +-
>  drivers/clk/qcom/gcc-sm8750.c    |  2 +-
>  drivers/clk/qcom/gcc-x1e80100.c  | 16 ++++++++--------
>  7 files changed, 23 insertions(+), 23 deletions(-)
> ---
> base-commit: 98e506ee7d10390b527aeddee7bbeaf667129646
> change-id: 20260102-pci_gdsc_fix-1dcf08223922
> 
> Best regards,
> -- 
> Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> 

-- 
மணிவண்ணன் சதாசிவம்
