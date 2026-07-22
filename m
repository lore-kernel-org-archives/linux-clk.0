Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6482933F5B8
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 06:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784701485; cv=none; b=e6jUUeLGkZjjn/Or7uOs6atJ8VTkTbB7s6PoEEJFKYN1SQgLKmhV9+d6b/dCz5doyyBsTjBt2ibzp4wCwif90oRtAgf5KFuhS3LpnYU13PrsgKQ1r8ydDoOi2k92POt9cVKOxNCMqSyveVMGcL9IMuuGS83zwgOovAH8ZHhGJEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784701485; c=relaxed/simple;
	bh=4JrvcEngBvteukCLZF3brC/gQ6K4u5RpsDAUv1E9TNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KciJGb6wsGXH5yFlCnxBedyvUMqr/DCODfU6ZZnsjmpYzyL9Umf+Aw1KtcT0rfQpnBYJvXAAiF9/FR87mves1MaAKNVCINwXjSSPMqv6MDnFkDh5IF6YZ9jmdmTxf55VK9uZn5hOAuuCf35LaJaliXSPiGMBdJzZXtTddQvjQbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AqvKH5uq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fuA87aBR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AqvKH5uq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fuA87aBR"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53gpo3473670
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 06:24:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UjYqDC1SKZ3nBm6fQIO0dnEk
	EFHe/0NSqXY2M9ZBb5w=; b=AqvKH5uqhvazImNG5brZGoDvP4skotjHkY1U+hdf
	AR/9k3jWtiRI8AjwO175fSOjx9wYY8Ph4farlo9GU4BS9bKQhioWu704tgCquO9t
	mcy6ELqAeqfhreeS6gEXv3KReYvEwWfsx8g6OJ9/hmVSHzk+TaUU9/uQSqh4yK6S
	G7KFzuQcNwRnJAyQGBHUSIBpgcDXtj9M35YHe0oSj74e5EZWh8v+FzqpVoYcm80s
	8ca6StMbPXiWoRf1vkjD/01bYooajNvW9iGJ55zRMChU2OaZAg+AMsg81K3ACXvV
	rDm5NH53OY748gSa2Q33ydnXaSuUZZ5Zq/DUuA/TdcQa6Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6ftjqp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 06:24:43 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0408254aso127867011cf.0
        for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2026 23:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784701482; x=1785306282; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UjYqDC1SKZ3nBm6fQIO0dnEkEFHe/0NSqXY2M9ZBb5w=;
        b=fuA87aBR/boMm3Ax8Iu+suOZlbzzdnMS7TCGfgAmc5VKt3FEEKzsgid1MAVLVaSgGB
         NitRggbJ9zhpsEwyzcaeSDdGQrx3fWuVj4U/9cK49LO9/kV+YdK9F6m1B5Gm2P0FJbg+
         VU7psC+hVvqsNkqhIz89g5w8I3Vg67AFN6v4WvddNzVp6g8yYBbKPYm9u0bJBeP8LE4s
         27hRIq7G1NBP8RIHzC9+ETGPib5+volrbNwknrvVqOqZMtBjmhPJFCs29NlEzplAt0Gc
         orPQFzr6dWJ0orWi+3cIeQkLFC6lD+iTBCVSm0aTLekyS+LZRaf4ldI6VTv0OmWV7FY2
         fusw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784701482; x=1785306282;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UjYqDC1SKZ3nBm6fQIO0dnEkEFHe/0NSqXY2M9ZBb5w=;
        b=gu7t642HbKEf6h7LTj/Z4dVm5Std/TqbQdJB4vKafRfFylCnYfgzE6RoqDkULfH6tc
         07L+vr1A37eIgS2HUT18G15zV1sW6GNEmHM/gqoN/aqAPK7os0QSfL1eEBfqnV8LCSCc
         vR1gtGUZtzV1578hddPMeGuesXjLJX2Gt4fK4MXZIjV94MozMl3jPBFKR3jpxdawdY+t
         D9qKUeAwWoV0UmBTMe0xbb7w3+Oz9p2csJhIUN1e/GDcKScje9bcMrsep0sqyyZn3/5V
         5GhWTN1ktLqTR0NpF/XD8sWkpnkOau89SsdG31TR7CTOd0OwH231eRbCPgqDryiqA87v
         fi9w==
X-Forwarded-Encrypted: i=1; AHgh+Rosz2+OVojT94XqrFOv6mHeC1B4bt3t4Z2MhOTy+7epdo0C6wjx8j5EBK24P4i7xJFU8C7f2ssi2qQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRER996WAnwCeLE7cA0z/kO4DivOzZOvlzJ7fkKfwPzZvPBWgm
	XUj6T3q1H8/uMmxrS9RpZkC21CmJgWXV5sVQ2Y/bGulk1g5dKavg2uJBA130o9iAMJLODVvVvt2
	bYj/CaZi7fbUosw7Gn4ke7zZofWoBsM8gs8V4S2zdTbXlBN/7cX83nh2IccsGInY=
X-Gm-Gg: AR+sD11OKhJHjd8ZSVUzVj9z52nyzDtoLKir2n37rSYv8k5fgvmDhCtd9v6oYHEMlST
	PcUTH+QEKcKFTs0y1sn5BS3bgS9LjwQVdDExSGnz5b8vo4PEAFKpLLJQw2eBBTAlgFMviFbDv50
	WQC53RkegaIR7PwoxkCxqyrZPfnyCuw0b0mKfzfcJncNx5iCLQshCwLNXMulYFZbFu/oylT5v5B
	5S2928foY7JeBx5Ru50GRgumOK8n3NYa0G2hIiR93wPuZpvJQUaY2YIQVK7iejn6CNDAN924yrt
	7nPzcHuezJzzlb54A4yUcmNdN4CD0T7Zwh4h5WwQi0LI/rRgwNypzexPQj6M246RxQziq9HHk/G
	AUiMeqw5Jfrj1hqgfRbgedTN8L8dit8c1L4RvFhLxHc5seUaMqBkexvciASw//8kwXyM6svoQ9I
	gR0Lk7R1HG8hmx0w==
X-Received: by 2002:a05:622a:8c4:b0:51c:b98c:f772 with SMTP id d75a77b69052e-527a69fe0f1mr28844041cf.15.1784701482431;
        Tue, 21 Jul 2026 23:24:42 -0700 (PDT)
X-Received: by 2002:a05:622a:8c4:b0:51c:b98c:f772 with SMTP id d75a77b69052e-527a69fe0f1mr28843821cf.15.1784701482014;
        Tue, 21 Jul 2026 23:24:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9d318c0sm301804e87.38.2026.07.21.23.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 23:24:39 -0700 (PDT)
Date: Wed, 22 Jul 2026 09:24:37 +0300
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
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: shikra: Add support for
 AudioCoreCC and AudioCoreCSR nodes
Message-ID: <gotzbjedro6lkzpk7xfszzymg4rd36jb3qojwlm5yelvi355za@jufl7tenh26b>
References: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
 <20260708-shikra-audiocorecc-v2-4-b320d822cdd0@oss.qualcomm.com>
 <71576059-b5cd-401e-b4b0-c1784f24ba46@oss.qualcomm.com>
 <81ac9bcb-65c8-4cd5-bc54-c350f24d06a8@oss.qualcomm.com>
 <cb9b3fd5-e63f-4367-8fba-cd3cd11fedf8@oss.qualcomm.com>
 <b9540345-63c5-4da2-b761-cf1aafa8286f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9540345-63c5-4da2-b761-cf1aafa8286f@oss.qualcomm.com>
X-Proofpoint-GUID: ocRlLn-n9GBfs-JP0LGzBNH2416JbzAq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA1NyBTYWx0ZWRfX9PDuNWTUbVHj
 +G0z42d1RaWvIEKIgWownpzsZVxUmq0/BHDR3biHBQqLsIivU0GFVScNYft1c195E4mlLylrmSc
 jqTrX79dfoyYx11WA8ZOCWuzPkJkUkFWvDq7IqENCU2cDDxiCJvowvk04FPqxgVsDIKyim1pKhZ
 4Wjh6ljP8DFWjHJGd3qiWKK3ACnA5BqmeKAjujCjqj7pUtHzwhA+R4A8cS5ktaAeObrjDd6hnXO
 TIzG/8xtEl1nxsQs98ctvj6KHupBlpTuJ0QTbCzqmoPFRQS9jTS44nj5JBnr++f5jyzaShu5x3F
 LA53/JI+rBJK+D9+66nFfYuGo/jrN80BZwcC+ml8Q1Kz66yK7aU82QnEbWIqR/WAj4cIr/4r3xs
 xqKE9O94j60CgfyA3N0+rqPJVDoNvWi1P/2M/xqUwOgFk1+LP0U0w4SvOQeuDkGr1/Qba68YGSS
 0M+mGk0x0e53PoG78hw==
X-Authority-Analysis: v=2.4 cv=e/o2j6p/ c=1 sm=1 tr=0 ts=6a60622b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=ASnxAr1qJVsTKQ4uUNAA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: ocRlLn-n9GBfs-JP0LGzBNH2416JbzAq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA1NyBTYWx0ZWRfX7O0F4JuFPIyM
 sS+cbz+BEvI/4vcitw5fXYdQ4jHBP3VDSFDDOw7XkGNi9opVfbDwqtDTsutRApPGwQUrPz7XRhX
 8K09o1z559ydjmVVlX2cHivYP+OcPM4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220057

On Mon, Jul 13, 2026 at 06:01:34PM +0530, Imran Shaik wrote:
> 
> 
> On 13-07-2026 05:44 pm, Konrad Dybcio wrote:
> > On 7/13/26 2:07 PM, Imran Shaik wrote:
> > > 
> > > 
> > > On 09-07-2026 05:30 pm, Konrad Dybcio wrote:
> > > > On 7/8/26 8:25 PM, Imran Shaik wrote:
> > > > > Add support for Audio Core Clock Controller (AudioCoreCC) and Audio Core
> > > > > CSR nodes on Qualcomm Shikra SoC. The Audio Core Clocks and Resets support
> > > > > differs across Shikra variants based on Audio subsystem enablement as
> > > > > follows:
> > > > > - CQM variant: The QAIF driver runs on HLOS, hence both clocks and resets
> > > > > are required to be supported on HLOS.
> > > > > - CQS variant: The QAIF driver runs on the Modem, and required clocks are
> > > > > handled on Modem, so from HLOS only resets are needed.
> > > > > - IQS variant: no soundwire codes, hence no clocks/resets are needed.
> > > > > 
> > > > > Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> > > > > ---
> > > > 
> > > > For the sake of simplification, can the resets be enabled
> > > > globally by default?
> > > > 
> > > 
> > > By default (PoR), those resets are under HW control. For audio use cases, software desserts/asserts for switching to SW control. Hence, these cannot be enabled globally by default.
> > 
> > What does enabling the provider node have to do with changing the
> > state of the resources?
> > 
> 
> My bad, I interpreted it in wrong way.
> 
> We have IQS variant, where we don't have the soundwire codes, and hence the
> respective clocks/resets are not required to be supported. Due to this, I
> have kept the status disabled, and enabling only where it is required.

Would it make sense to do it differently - disable them for the IQS?
Is SoundWire not supported on the IQS at all or is it not a part of the
EVK?

> 
> > FWIW there's nothing like reset_sync_state
> > 
> 
> Sure, I can keep the audiocore_csr node enabled by default.
> 
> > Konrad
> 

-- 
With best wishes
Dmitry
