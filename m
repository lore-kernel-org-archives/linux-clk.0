Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDB828312F
	for <linux-clk@vger.kernel.org>; Thu, 14 Aug 2025 22:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755211870; cv=none; b=Ufk9cXjXlz2BEnlfgKEicyQ8li3f19Y52Ag3vIfz8Sqos+U2jHuvSZBLAcIvywdSyGgbbZTIBuFM3kKVhwPtnNxROVu6h0k32sqDuU5TIjVBZGa+fR6HhwPfq91+A21SwO1UIOPQmPuND2Zg5pbXuGq1xAfqYNJm7IMbP5iWhKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755211870; c=relaxed/simple;
	bh=VsRfvsLbvMPweRFwX9yd1l+oGWIeHLlnNvKbVKtNBMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NmmZflm+sdUZebr9y5qrtR1/DGsBaUfQ0N6Piz2jQ4/UfbXLLEw/4O10wI3Tl/TXhnomI0J+bI5XNlmtI5nVCtM7hUHwvOyAh7loQ3MHYtHzEoFy6vvYFESDJQ0rZFFaScF5IPn0tYSNVai0bx0zwBzctZ1Vftcw2OC84lfYfqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MU9v0qYU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MU9v0qYU"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57EI90lE031866
	for <linux-clk@vger.kernel.org>; Thu, 14 Aug 2025 22:51:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=At5mFz1vkSy2faOkC/EtnV9d
	eGFeKo96q35XzSytUj0=; b=MU9v0qYUV+xumib0ODJKcZrNBxxl+lSpjy8TNlgZ
	9v9eV1aYSpbpAPYits6nrach4CQU1KixVp9hLJpHsjZK+TLqDyWYLK0XatS/X99j
	iV/k+fwTaLr10voXU1QcBHyEBAearCgIja/3rEWYtwEchiOQ98/Dg8aA2lzsiH+a
	2poOjUwxiMiLVi/yZ/TLJ94FLK1cxSCwmdzBKQdEOSoO/7vxMN03f6FTwPTj2D8e
	aGB+s8oYduUEOX5pm8XdnI08aq87QrPJdzckw6ErIOG1WRnA9NeC1kif4f/igcE6
	d4B3d6QUGsqPKqNsAfP03KAT3oXupMaFK4WhdJEBquwQCg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fem4na78-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 14 Aug 2025 22:51:07 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-76e2ebafe0aso1252726b3a.3
        for <linux-clk@vger.kernel.org>; Thu, 14 Aug 2025 15:51:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755211865; x=1755816665;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=At5mFz1vkSy2faOkC/EtnV9deGFeKo96q35XzSytUj0=;
        b=QygP+BqqBLOSZ28hTelQ9qWACTZ6uMb0J5U9VQnzjoJJ0v51SSgOltaVET5X8Z9CVE
         1OKJAjMR3aAVysRarX26c+sg7MxojBsE6DQ2NyDwaBUjTNF8+XZcouKO5GilpdkqkQrp
         90FmM/EPMvXedVYuStIvTMhOBCPIU26eC7+mb1fMPn5xR+JeuWF+w/Z7UeoZ+6SsBkjT
         Ps/B5VmjsPjaeFWNZU1khxUoIOkSVIwBQWRLEgW1MJO4zpDy2W/D4UgVyHfbQTKYScic
         hCydJYsIJ1Ub13F7MaLbnaPWtN3Rm7+zhuzDRPU9ibzr/icflz4v4A9k8u/vcaOtfGn2
         Gi5g==
X-Forwarded-Encrypted: i=1; AJvYcCWucU/Xl1sK1uuacwSoB+AEUgcia9txx9/5erPfKgmlZTNqgqtOj4NIz2pJovEEfLm2zM6byw80Ceg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yychdq3sBlkdP5CojP61oDtdglEdtpEpP8OCL/JfsXiNr7xZ436
	qbfOr0pXqPDGlHXGVLbFHC30Hzo26BsOAwcRNYreKJbALtuyrivq+LWU0t9KR2pnI9VYjSVAoKz
	O/rey3jZ+P8wC8EtjkNPP017lb/eVx7dyhLu5ku7FtHlHgk5vjV2DFF0ZR6KkjCMNC0eMglU=
X-Gm-Gg: ASbGnctWlGbh0TmSiy4p0nN4DTHsWCvpGoQxKnOxsai5aiwoPjt7WOn+ev9A24UJSAO
	kzLzosQjDK5nL3AHvVoMoCDjjmNPvNufuGBkH4s9RSwfTWErcEvUSIcjsyerrPkteeev0NCkDNT
	XigqMEySpPkM+I9W2WKVb9PLSiwPPsYQDUHu1vr5k0df247YVVal5xjaBTiJ117U1WSsX1LjWCY
	ayK9fnufIcpIYmrPGHrFhF3y3mEc4XHY/Y7msgFHl4tWs2pd4DDS9DsHuj39I4Uz38/cpoIwqZ1
	ya//Hbw/rgLeipUomi/yOYMxJdZC16UFThpbjwxTA48vht9jVwGN9BVNxHSrZo2Z5fWsGoPM2N6
	RiUhr+TsPUrJWZk7WLfKK4P0=
X-Received: by 2002:a05:6a00:a0e:b0:74d:f997:1b45 with SMTP id d2e1a72fcca58-76e31eedebdmr7910298b3a.8.1755211865655;
        Thu, 14 Aug 2025 15:51:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE82TPNJ3ll/m6MhFabEUR14MGIKrwXTkhR8iXZvn445BnTFS2znQUAA1pHvzWHlQz+zbMePQ==
X-Received: by 2002:a05:6a00:a0e:b0:74d:f997:1b45 with SMTP id d2e1a72fcca58-76e31eedebdmr7910261b3a.8.1755211865187;
        Thu, 14 Aug 2025 15:51:05 -0700 (PDT)
Received: from hu-bjorande-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76c61705bd7sm14513362b3a.31.2025.08.14.15.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 15:51:04 -0700 (PDT)
Date: Thu, 14 Aug 2025 15:51:02 -0700
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>, sboyd@kernel.org,
        mturquette@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_rjendra@quicinc.com,
        taniya.das@oss.qualcomm.com, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] clk: qcom: gcc: Add support for Global Clock
 Controller
Message-ID: <aJ5l+0Fv7nm2vKuZ@hu-bjorande-lv.qualcomm.com>
References: <20250716152017.4070029-1-pankaj.patil@oss.qualcomm.com>
 <20250716152017.4070029-8-pankaj.patil@oss.qualcomm.com>
 <28ea2b11-a269-4536-8306-185bf272bd60@kernel.org>
 <2yekmjqihkzsfjr223vepigfj4hfruleigguhrlekp6s7riuxk@ta5kghr2kafi>
 <4559a710-8b4f-4988-b063-40486fe0ffe2@kernel.org>
 <2025081338-backwash-oak-0677@gregkh>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025081338-backwash-oak-0677@gregkh>
X-Proofpoint-GUID: HwPPeOMZwEOy5W-Xoh2ZYJ1uBKR4Ff_j
X-Proofpoint-ORIG-GUID: HwPPeOMZwEOy5W-Xoh2ZYJ1uBKR4Ff_j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA2OCBTYWx0ZWRfX3un7mlCWNDXS
 O74fSUn9DlgbhCspuPAoMPKu0TZ2f6yYaQExBd2rTJBhLwozUXP9e6rtLE2YT46ZgYwana5BtlQ
 +MrO0IrFSXOkjxwZHAUPFvD+urpf8xmJsgjUu1/LncRrKfGVtxoZ1YTrUp9K1+ras5pnFIyaO7V
 Ds6ITmutMw6KH+PdfaT/UVl+MwlywHDtDSFrQxm2h38oMfvrlvjS9s/NVFUBfnNM/JvzPKp5fWP
 E/penHE9kZSxJLTbMGG/5b4rI4w6xTbFiP6NOxZMvBQ2JF8cSe1L8pDpQDPw3uxB87s15MwjSxT
 v0EHal4yCJ/2I1Wm8ECtdNt3WGUBL4xeOGw8lbYQLQo9KVVa+bbiAkjTTKXhhQciDwiS8iIBEmW
 snZHALwF
X-Authority-Analysis: v=2.4 cv=YMafyQGx c=1 sm=1 tr=0 ts=689e685b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=mDV3o1hIAAAA:8 a=xkPlMqQ6EUx7zbaPWWUA:9
 a=CjuIK1q_8ugA:10 a=JEtk54xxEQEA:10 a=UDyAGHZwfzgA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-14_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110068

On Wed, Aug 13, 2025 at 06:19:20PM +0200, Greg KH wrote:
> On Sun, Jul 20, 2025 at 02:18:19PM +0200, Krzysztof Kozlowski wrote:
> > On 20/07/2025 05:46, Bjorn Andersson wrote:
> > > On Wed, Jul 16, 2025 at 06:28:15PM +0200, Krzysztof Kozlowski wrote:
> > >> On 16/07/2025 17:20, Pankaj Patil wrote:
> > > [..]
> > >>> diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
> > >>> new file mode 100644
> > >>> index 000000000000..a1a6da62ed35
> > >>> --- /dev/null
> > >>> +++ b/drivers/clk/qcom/gcc-glymur.c
> > >>> @@ -0,0 +1,8623 @@
> > >>> +// SPDX-License-Identifier: GPL-2.0-only
> > >>> +/*
> > >>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > >>
> > >> Missing date.
> > >>
> > > 
> > > Per updated company guidelines we don't want a year here. Please let us
> > > know if you have any concerns with this.
> > > 
> > I remember the guidelines and they were about publishing your code, not
> > about contributing to open-source projects. And whatever you have
> > internally does not cover us at all. You can have internal guideline
> > saying you need to buy me a beer or I need to buy you a beer. Does not
> > matter.
> > 
> > That above copyright statement without date does not adhere to expected
> > format. Explanation how this should be written:
> > 
> > https://www.gnu.org/licenses/gpl-howto.en.html#copyright-notice
> > 
> > The GPL-2.0 license in the kernel also uses date:
> > 
> > "Copyright (C) <year>  <name of author>    "
> > 
> > There is no option without date in the license or GPL faq. I am not a
> > lawyer, so no clue whether this is what we want, but I also should not
> > be my task to figure out whether different copyright statement is okay
> > or not. It's your burden.
> > 
> > Or drop the Copyright statement complete to avoid any questions.
> 
> Note, we don't take legal advice from the FSF :)
> 
> That being said, any/none of the above is just fine, there's not even a
> requirement for a copyright line at all.  It's up to the author of the
> file as to the format for what they want to do in the end, none of it
> matters to the actual existance of the copyright itself, which is
> implicit with or without a copyright line.
> 

Thank you for your guidance, Greg.

Then we choose to follow the format used in this patch, without the
year, going forward.

Thank you,
Bjorn

> thanks,
> 
> greg "I talk to too many lawyers" k-h
