Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0915D34BA5A
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 13:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784725637; cv=none; b=O5N2Va3E1gihpA8u5MT7x3yaKbWzU8x7Sft5il38AXQ840XQWbIHpiXES0ZnIT2eJgJbfPmnrg2+Fe4u8XLXD5kYvJOQijrQCFqLMKpIdS+eCrmW6AqQdnyiFzpLngupqHOEFtS8y2p96Whw0np3je7GSscfMdNqZ/FO7emHN5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784725637; c=relaxed/simple;
	bh=ai6iju6dR/uZIB88E0DRbQrr+GbiczsGOoaTK4Bb5Eg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QTG5ndZDky82b21N5d7+2UyJoxyXU7L+/3DbbdjCjKJG0UyXIBH7nKIAMFIBs49UH5potTtHlT08s1HfZYrCw2rWfAWakIa+C28Y9DcMDw+haWY5hUYHOA2EKbpzrqxAHhVZxK0obQIxWbWdNj6k+i9SdpZhW2WO+A+QmMQYiXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MCc2DLgZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eWFG9Nng; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MCc2DLgZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eWFG9Nng"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MD1q9Z944787
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 13:07:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cdQWdnKwYrk+rfAfHK1HTim5
	6Ui9MiaZ7SBTJlM+4No=; b=MCc2DLgZ8PyZpMTnnLWBVJDsHNe/We6E31G6uunP
	MzgBb1G54xiFXTMR/kkZX7W+f0cGvouLMmcSlnE+mX5RkWqrixXFAw4M/+XyUgy7
	yxxHBgZArDZ9WXETBXvyUmxgNUxBK/QzwHmD6al8eqqxMy+6/S7VGuuVNZttcBkO
	KRvRnSL/43RHLmcNFiPvkbKxGg4Rfef/6aL1XaNC/54o4cUEVrhSp8HefIGP+urU
	QPozc/cGv6qmuT8K/XQJX2e9vhmrKyuZ2GOGYLAqYzaeARU8GtUDNhYChJzl+ktd
	vx2OfcpPkanhodAiv2xkyWVbAE+FDwUnaWJ7dnIM44xcCg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjs929ed4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 13:07:15 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-744e7cb9f24so3050976137.0
        for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 06:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784725634; x=1785330434; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cdQWdnKwYrk+rfAfHK1HTim56Ui9MiaZ7SBTJlM+4No=;
        b=eWFG9NngWx6qzEY5l71S4pLnZZA7GmBUMNqIzyQPeE3SqOz+IOzu7qujOnjS3SPcZs
         qOj+hTTTEzo/DPM7EnxZ922YNAJmsnKqG6h28FTVlH3jVVUrKUIaddjW5yJUijGkgIyT
         BhInjUZY+7q7ttIeouIuJkqDHdy6yfTO9t3lU1QeQFFjh3gLfnEMJ7FyOydeplL2b+nY
         6sCrqKQvhzTYpti00qGiXD7iy/Xn6PwYEviIYO21tn5hqI6QH+85OKEZVuPWP9Fp5mWa
         MF7vW+vnUcrpoZiTaLZAWlENc2MFemce12IplVMsdm4ttuPlSHT2BH0bvNrqJEGKX9wQ
         gZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784725634; x=1785330434;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cdQWdnKwYrk+rfAfHK1HTim56Ui9MiaZ7SBTJlM+4No=;
        b=c4z7QJUXLHRUuJp5JI2diDmV+nA69AQJhPhB8RMNAcVxtB/FTlPgShGEAWEl0+J4At
         VeUska22SKVxO6sSRzHN71IKKcCwsRLRmLCysyP1A57D3RK8lzpIg5lyE7U+vRuuZ/lO
         235UchRN0WB5eH3fZOX/nfa7taML4tH1QisdZPFhP3Z6yIJe9eHbzmvv4pvboTht5gnb
         jsyKq7CJcRNtokkjqC6A+BtG9Rm/k8QdlL4fhPqVkDGGNP1lUjPlMaqOlw7ydLj+m3Nw
         huKiBJ0I6Mrq47sTtS0xtfULtiAsMXk2rxrdmAQR7YLch8PZ2tBJUyKhvwjXZymrBQnO
         Rj8g==
X-Forwarded-Encrypted: i=1; AHgh+RoykiJfrtMEMkWf4AqxUXJS+WbbBJaYtppT1u+RfKKCQuuFdInC/sAFR1p8uoh82webmS1nCbyiaoo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuFd4sEvrJvbQhjDRMKo0u7paGvmoU9MlZb172sXlH7SMF0CNP
	GGNB5nI0SS4cOopJKAawMtazxoSK1nYGXgnQkmNlEQv0VLFKJL1XXo6IR4ZgE4nCqp6lsGzy38X
	RkUSRWgko+4p1oxMFtI1TLxJGITqYJTpDYzjos7ZLq9JQaWA7xe/yoKqXdqV/sY0=
X-Gm-Gg: AR+sD11rQFGaOA3uS8+StZQCViSnSubrqJX2dyJWKrATLhq5kikP6Zu24WTM6vLc6ev
	tak2v3VngUk+7goLIuFKWtDGrAYWgj85peVyO2Bd2mtjWwwjWM716jkVbzmszRFP0/YFni6cBl5
	sQKHPB8zTEVZ6P1+MGv7J6Nr7RtQi3MhIysihoyeRPkahlWwe04m4sKshlaY6eDuabm1rQ8LKBy
	5j7c3cSkXJXG/jP/45I9vrHVNbdICS/xtbGyHWu6wW2L8eyS3q+rbZf6+QfqplUOtC9WV6EVZgu
	b6AvYp84DCkOGGPG1KwjZW94Lz/HDXK4a/6A8M/Rpz1+kg4eGUX3rwQr4+u16h2o+0YbICpubtN
	QsgGaV0O827HfZzMdJ4xcMrPMff5ma1aO2jajDOOGQGar7jAA+FweaAREg11bRAikAtZ3QP4NkY
	7Epu6bBGLzFkef1w==
X-Received: by 2002:a05:6102:e11:b0:6ef:db57:ed3f with SMTP id ada2fe7eead31-7475376dee3mr7131959137.29.1784725634042;
        Wed, 22 Jul 2026 06:07:14 -0700 (PDT)
X-Received: by 2002:a05:6102:e11:b0:6ef:db57:ed3f with SMTP id ada2fe7eead31-7475376dee3mr7131923137.29.1784725633458;
        Wed, 22 Jul 2026 06:07:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b9b68fsm460849e87.24.2026.07.22.06.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:07:12 -0700 (PDT)
Date: Wed, 22 Jul 2026 16:07:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: shikra: Add support for
 AudioCoreCC and AudioCoreCSR nodes
Message-ID: <j7lvoibx7ktdiigm5w672ovwrxu3sedm4xdlaqtss4yymfkbtk@ug4zuiu52fcl>
References: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
 <20260708-shikra-audiocorecc-v2-4-b320d822cdd0@oss.qualcomm.com>
 <71576059-b5cd-401e-b4b0-c1784f24ba46@oss.qualcomm.com>
 <81ac9bcb-65c8-4cd5-bc54-c350f24d06a8@oss.qualcomm.com>
 <cb9b3fd5-e63f-4367-8fba-cd3cd11fedf8@oss.qualcomm.com>
 <b9540345-63c5-4da2-b761-cf1aafa8286f@oss.qualcomm.com>
 <gotzbjedro6lkzpk7xfszzymg4rd36jb3qojwlm5yelvi355za@jufl7tenh26b>
 <7aa3a96b-d1ed-4686-b38a-85304ec61425@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7aa3a96b-d1ed-4686-b38a-85304ec61425@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEyOCBTYWx0ZWRfX7ImRg8bFVBXO
 MaXezguOCfeVzk0fOosmn77u9cytoRr0DfY+q66O4UqmUFyTh464P7PuxIOXujFEp1sUhOkPZEH
 4GqcxalIJpxQWwi1vlr5Bk3+kIliwGQ=
X-Proofpoint-ORIG-GUID: SsjItpzcEd_1m9vlp5iJSY_H82I7np0x
X-Proofpoint-GUID: SsjItpzcEd_1m9vlp5iJSY_H82I7np0x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEyOCBTYWx0ZWRfX6aWQ4srjzLqo
 st5HX/dyTaI+xOCboTj7I3yRVPHjcpkO/JhTuoua1uagn6MqQVrsGmY4gh0GXQkAZIZew5dkl+N
 6u2quwlS/G3OvhZkIXwBfvIHTyElYI3ZZA/H+ZSHRtbAMnN3YtDit2DqThL6CxB2TVfeVTiNYjt
 EMMDuajEXs6Gs5x04S7ovckEtN4cBokRtnFarzepZjWqAGC6kQIVCzwfKqpn+AQLFwiXbEqkNVz
 0BQDuNKAymhejMB6K1AtC4ykZ9QdAHE+QraUQ4cbQ8x8GYJPImLOgNSX5t6vdAB7Rc2JoU8bxs2
 JAwA4fVa2OHydYZK73T3zBmtkj2WKA/2jsTKmqDlnoCvFJksV755KnboxyYmfDjzLieGZutJCxT
 SwpNdPRXrWht1b4tvC4T1mPcLXF9gAjW3gmDkikcxbQq5svspgAaogLlBZe+hr0pEBB1j/sKbtN
 1IgkUNhAwfmzvNgUA7g==
X-Authority-Analysis: v=2.4 cv=QahWeMbv c=1 sm=1 tr=0 ts=6a60c083 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=6hxfLnOtrSwZhmOnFAoA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220128

On Wed, Jul 22, 2026 at 04:33:21PM +0530, Imran Shaik wrote:
> 
> 
> On 22-07-2026 11:54 am, Dmitry Baryshkov wrote:
> > On Mon, Jul 13, 2026 at 06:01:34PM +0530, Imran Shaik wrote:
> > > 
> > > 
> > > On 13-07-2026 05:44 pm, Konrad Dybcio wrote:
> > > > On 7/13/26 2:07 PM, Imran Shaik wrote:
> > > > > 
> > > > > 
> > > > > On 09-07-2026 05:30 pm, Konrad Dybcio wrote:
> > > > > > On 7/8/26 8:25 PM, Imran Shaik wrote:
> > > > > > > Add support for Audio Core Clock Controller (AudioCoreCC) and Audio Core
> > > > > > > CSR nodes on Qualcomm Shikra SoC. The Audio Core Clocks and Resets support
> > > > > > > differs across Shikra variants based on Audio subsystem enablement as
> > > > > > > follows:
> > > > > > > - CQM variant: The QAIF driver runs on HLOS, hence both clocks and resets
> > > > > > > are required to be supported on HLOS.
> > > > > > > - CQS variant: The QAIF driver runs on the Modem, and required clocks are
> > > > > > > handled on Modem, so from HLOS only resets are needed.
> > > > > > > - IQS variant: no soundwire codes, hence no clocks/resets are needed.
> > > > > > > 
> > > > > > > Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> > > > > > > ---
> > > > > > 
> > > > > > For the sake of simplification, can the resets be enabled
> > > > > > globally by default?
> > > > > > 
> > > > > 
> > > > > By default (PoR), those resets are under HW control. For audio use cases, software desserts/asserts for switching to SW control. Hence, these cannot be enabled globally by default.
> > > > 
> > > > What does enabling the provider node have to do with changing the
> > > > state of the resources?
> > > > 
> > > 
> > > My bad, I interpreted it in wrong way.
> > > 
> > > We have IQS variant, where we don't have the soundwire codes, and hence the
> > > respective clocks/resets are not required to be supported. Due to this, I
> > > have kept the status disabled, and enabling only where it is required.
> > 
> > Would it make sense to do it differently - disable them for the IQS?
> 
> Yeah, we can keep the audiocore_csr node enabled by default and disable
> it in the IQS variant.
> 
> But Konrad suggested to keep it globally enabled and not disable in IQS
> variant for simplification since no one will consume those resets in the IQS
> variant and no functional impact.
> 
> Please suggest which approach to follow here.

Konrad's approach sounds fine to me.


-- 
With best wishes
Dmitry
