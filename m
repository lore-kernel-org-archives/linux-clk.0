Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4E242D77B
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 10:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786443036; cv=none; b=GKqXFNsYrmN3p+YTY9hrpTu4Ty7sqWUBppHwbqTkRLspp/JxcF248/q9VH9JhGwO2rJO2KjiXEG4BwRwCJ1kjfO0nk4p1uxUxPrU0n5ZN4KMloBVMrZK7GbEbkNI8u89mCm/VK6rzhvYCP2Alx+h4mQwFInyTUjMOmQMzDfMOo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786443036; c=relaxed/simple;
	bh=fgXs0ECcNvgGaeJcwkLzQCD1n22yUPG5FRti3ek/DTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e4W/oCI+C9uOuixEQYy/Bc6HxkgCtzOh4p8pqaeyMjNrRk0b8z7/5wCr1kqssU+/xnUVFdy95CDG+JYGoq6cm0+o7jfma1aKQ4njZfUIdrUmD0GbrKDm9BGpoJOMNvRRfL1GSxjKR5zt/nEvveRTYj5OYunVhnRUiNCZiWJeZY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CcY7HrCq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QvH6JZ/6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CcY7HrCq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QvH6JZ/6"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67B7JlMb3552851
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 10:10:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7QdukdYst6AdgiExdWVsNfBj
	ptF+nLJuNmughEUGSs4=; b=CcY7HrCqV+t/PV72ChNr7uGjZIvc9mVnyJbUByF/
	cD3YK/9a81JSJz0MqEBlyWj2PNNH9iwDWOHgKl9AUKgLvnkp4UlDH1NAeRzXgsJA
	/SIRNPnxqeQwqFiULRtcsZ5UzGBK2b3zj/JX8WpxttDX6fbG82faqRd9sd0XaKKd
	bnv2jlgnSEBImVOqpyVsj/lsFSrhlUHA3tyOHXGjMl5G+2XiN+iKT2DCt/FP31mZ
	ivgkLzrToti54cKiA6e0XyTyViM6zp12JABtnTvNcU58jD2zViM9JBzUMMST+/k/
	N8My1AuuFQgtL5UqAVukh62xwuCDIQao9zosO2YZ2BThDg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyqmk28em-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 10:10:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1d137a68so62799361cf.3
        for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 03:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786443026; x=1787047826; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7QdukdYst6AdgiExdWVsNfBjptF+nLJuNmughEUGSs4=;
        b=QvH6JZ/6FGA4CNXN5EvdM497vlsmbngpcXN/JjkCOo6V8YTeyeM+Eu1ytlq/5D89y9
         MiMFnjJbM58EtFf/Vdr2lYqCkkPwveARU9cK9ZNoi2zpbLVMt9B0q9gFLn9/74Mrmt4y
         3Kf2wLNVwTKJ2CRR2KQKwe6UZqO0xr6v0cRBVWjEgSRBIRJ+tkpVw0lDRAygTPkxcqHl
         JUChWpFpj3genYys3bdBaXU7f2jI04HdDpI1uNi83iarqRXjymakgxHXqNDLhI2EPorG
         WNU2FDF6PIS8B3jeTrz4qW2/ozCZOkxjYV5n455oHwcrQmO70sV2cKndOSpu8VpKJrJy
         CeMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786443026; x=1787047826;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7QdukdYst6AdgiExdWVsNfBjptF+nLJuNmughEUGSs4=;
        b=CUHH3kQw9CyXIInhCFyjPk7jRqWaBKF2FR/0aZX3SsVzNFHNwShMLV0ALDbIdQCxLB
         D/ID3Jpz9z6Iqt/4NuA1fKorf5qweSoCD2DUqfj9CZBbMetqBdc4AMLIvDTfEuCHab5d
         2/0vg6ZzUyXlXnJ/86IGtII4/G9sMaYrOPjEOcn5S32uCRZIQhSqujc/i/+TJp4gGTGt
         Zdew7Gx9utPWwqyhQHFvcr+A7C8kit49NZL5LoeYeANZBByJnzVzBGI3GGsDuUMfbPep
         wsQWxmlA+cJmvd2r2gdz/rYstqo3SSCKJ7k4IF9rc0yDCJDJe0XJhLaN2pJMEy0Nk0rV
         RU1A==
X-Forwarded-Encrypted: i=1; AHgh+RoUmJpkvvRTAypma/UmF/Mg3LzajqpIioxCH+YpjG0Zxl4f4MyQZqsg1U5mmO2jlXOvsRHHJgdWfGQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr+Pm/gqpoNWkpy8EljB8pGqcILVBwj7GMVN4a4mo75/hR4rHj
	SXxxXlobiYmmOhWDcolp4vUXQBvPa8PvNercgsXXdw4AgApbpXatTiJ3mRRPE58eoTn1vDLOBNX
	/psT8w0ckyqCaPMJFGNeClS/tTesAurmGOocyFYV41u33n9PJzRh3RSsco/cVhzA=
X-Gm-Gg: AR+sD13lwQFjRnlAKI/NOyuwkF3troo+Wn5lv1nVoPSPYxl11iC0wcV8lwH5qGRmm4t
	doCdsn+Ll3sqAif2Nom+BgqF1Ozzk19ehXVgZXOlBcPDly3ucJ6Cf6HkEwCnYGllV2FNMzl3l+9
	oGqJ1YAuenIqeSHO7bCbzhI4UJ2B+Xf5hXE3e/JLoPKW881ft7qhLCMaCdta9H+c3Whyz/b2x2o
	n+2cyn9NIXQHZUsgAhZzjM3YunnhSBD4djQRlGaojT2XWunLUxnhjE+kcTyD6gaH7NI4vdgIJAb
	s896FjB9zvAiSAJ8TjqIXSjsDm7tizCzSUJlFBV+hqcZiaCCynNwYlR2+JgeilGJO6qJsROFLB/
	iFqVDtFvEtGoJ2sZxWBcb1xXvEsrQlu3jXGn1rFSat8tla1g/mdxWP1v5WISi5xBC3isVYsycAE
	x8Ct0bD1um/oR74w==
X-Received: by 2002:a05:622a:178f:b0:51c:1006:a024 with SMTP id d75a77b69052e-52d586c8d5amr15905171cf.43.1786443025738;
        Tue, 11 Aug 2026 03:10:25 -0700 (PDT)
X-Received: by 2002:a05:622a:178f:b0:51c:1006:a024 with SMTP id d75a77b69052e-52d586c8d5amr15904781cf.43.1786443025281;
        Tue, 11 Aug 2026 03:10:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b44872e696sm194374e87.68.2026.08.11.03.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 03:10:23 -0700 (PDT)
Date: Tue, 11 Aug 2026 13:10:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] clk: qcom: ipq9650: Use icc-clk for enabling NoC
 related clocks
Message-ID: <ekugszfavtnbsprtjyid6htrjqg4iziss4hknniuvistiwy3l2@rjbmoaau5zh5>
References: <20260519-ipq9650_icc-v1-0-4d3554c94257@oss.qualcomm.com>
 <20260519-ipq9650_icc-v1-2-4d3554c94257@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519-ipq9650_icc-v1-2-4d3554c94257@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA4MyBTYWx0ZWRfX0n0ZxXRA7XSM
 LFQiU2v2QRuILXpLYTZqtnsFGWdKX2dC5U7SgqceTaIKIHuqMl+0NWWxSewFXLj2B2HOHT29Ncz
 RXyPd2mGx/e96FxRf8XrcvY4fy45/vEWQr5VoDBL/p6fwFB8YjDDYhgiLuML5Elbhymm/1UF/mz
 2xHtmuYUbAAxcn6Nrrk2Tuur292DToAy5pflqX3I09c/NwADUKef0IX1ZNYiJ0wpCRl0dLhhkiY
 hLiWvViHNrI5mEkLPqG2eOaG2s93iFWxxXtN4n1Ri0bK9iyjgKj7pmN7TkvTjR8bqvE1NeYLyPf
 GLHVh+fSCO0TrrOKL6TGHcQVdn25KbDdfzIOux1NE9DbW7lPhiPydAet3ADfuix8a8GvrZAM6o6
 dLyssvHrIKcXWoURWohRHFoAGsMdPvJDwhFUOc6lbFyTSlSezADRLoYYpOGiwj2/c17ONtysVOW
 VCcULNBXeGUfOVRNbOw==
X-Authority-Analysis: v=2.4 cv=O4YJeh9W c=1 sm=1 tr=0 ts=6a7af512 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=5alyi5PEbrS2V74xuKgA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA4MyBTYWx0ZWRfX90MbhWDc3kXK
 Mm8m5buFsev0keQlhs3L5CXwNFp++WK0hpibQ8YXaTNKyur0ABb34bs4wXSbd6KbutO5urUJ+8C
 wceCswBmPdJXOCh4Ui01fHbKUG45lS0=
X-Proofpoint-GUID: 2hTyqihG94312N4iLcgMGo13SDSshFIw
X-Proofpoint-ORIG-GUID: 2hTyqihG94312N4iLcgMGo13SDSshFIw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110083

On Tue, May 19, 2026 at 02:17:06PM +0530, Kathiravan Thirumoorthy wrote:
> Register NoC clocks for PCIe and USB interconnect paths using the
> icc-clk framework. Without this, the clocks required to create
> interconnect paths and access peripherals connected to these NoCs are
> not properly managed.
> 
> Also add icc_sync_state to ensure clock states are synchronized after all
> consumers have probed.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-ipq9650.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
