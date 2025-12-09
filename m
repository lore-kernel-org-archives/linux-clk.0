Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AFF26B75B
	for <linux-clk@vger.kernel.org>; Tue,  9 Dec 2025 15:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765293318; cv=none; b=Fj/8dt2BLlkTlr83Cb7EvS+coc1S8swXM/DhYS95IVbxZoye1ft95mLYU+S+UlFbRlqqavEAt8cVC/1UQsz4EmczU38WsAIheaG6gAdtHfGLhHqbwBfWYSBWZNihi0OQsLkisY38DsjYzRbom46ZEaAopXwPR7+GDFJTHuCSHCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765293318; c=relaxed/simple;
	bh=bfEpgrRI87ilasIdsOHik5nfvcqiS4Pk28FA1VmQzh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G8s/f1h6/MB69ZAt5wZFV8fkohnBGNpYzvlO/hnqxf9+hKY0XA68x3dFB9q3nVbcv9U52dT2AUvCybBxyoQF+JQ8ZmzPzHD6IRxdRNFi2tz/WxIlpcbij9g7IXZWgGPnbO3dEZW4MFAGH9Kx2sr6rJhI28B4zO5vl/M6alDknZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ff3ji8pP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dzfgXWay; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ff3ji8pP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dzfgXWay"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B9F9GtU030114
	for <linux-clk@vger.kernel.org>; Tue, 9 Dec 2025 15:15:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bR71Xk5dq0NZn6EHNiA2Q9TN
	z48IxtWfylK+4IF3o3k=; b=Ff3ji8pPZzx5Y3fHMEw7x+osjsRYKNuAL4DXtO+/
	SCbA4/JrEv3HQVTo1CwL0o9/ch09Q8HzfMB8ZsnWH29XSvBodTDNJKI9in8zh8sH
	NaCp55PITi59U/psuZfYkofoGIa2geiAi7xYqepdjRV7npP2+FCTaThisK5dHKQj
	cYOORY+W5XsP7VhFW1Tr24KfHOi//3OSAJjrqxDT4O7jonKHxHkMELN40PqPXkgD
	4URUHRRgULJsyKTxkEoNkUDKhvvYsYAYa/GZuVfKhWwiMJ3zjppmBndEsoCLdqJc
	bFYmN30RTPXLtyekdFW5WurejONG6/UYztsM51Xx7MBaNg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axp5p00wk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 09 Dec 2025 15:15:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1aa7a073eso10228181cf.1
        for <linux-clk@vger.kernel.org>; Tue, 09 Dec 2025 07:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765293315; x=1765898115; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bR71Xk5dq0NZn6EHNiA2Q9TNz48IxtWfylK+4IF3o3k=;
        b=dzfgXWayCxxqzV7+Rti5c9IyNpAMJF0GjJ1FSXcoL5QZttwbOvgPVyqqpGEZsAT5MN
         iqqMLCS7gT+x0GHLPRlbDRDOZYroqewXuNizbDHuJZT7nCgb3G1aPagE4QDBc9l+qaS/
         /26TOmjgk7b+FOAAe0WzNNtGczvNhPDqnUvcxQ0o5K7S1Umyn/UpDWzIJzi6fMVMS939
         gNk5yypkLCwRYGYpRJxgoVfN2hRLhWvuL314CKsRODdahOMkzODWuyYhilleLkH7xLpc
         PBwqxoKBc2qWxew80eQsF3c8eViBsb1PTO0ynw2v/vxglc/dvEFA2geQWgLlVuoVnxXn
         IRLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765293315; x=1765898115;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bR71Xk5dq0NZn6EHNiA2Q9TNz48IxtWfylK+4IF3o3k=;
        b=uoIVCuNrG1MZ9sthXdOTpraNXJFkV9ruDzhypWVTek5pzaCmQystaFOcghqIfLeMJJ
         O/BnnXZBbjjFNpOcHDAuKSuxPz01LeAsGjj6+rZQUStihurDSa9Je06Ux+j+JXVCiVPB
         212uOM92Km2Uj5FlZGrJdCcMTcUAZh3oS4NCqjqUgP1VvojuCmOxM+HP+YweIZSl7s8J
         4f5yS5c7IOsWDjSv1FEQt3GFcfJvgjyyx7DHuUtg7CkEUipYSibm2wIWyol1D9nWTasS
         gFq3tnOrZGnKTspHIziOT/efCVM8CHpliK540YfREUa8bsGrL1RGGkhZ/FgaQZs9jOyQ
         Jzqw==
X-Forwarded-Encrypted: i=1; AJvYcCVb9iHPKH9leTkWknVkJAaBzKewR8T8nlkeMnt5QToyb1pEuOGtrhAUl7BIO+O1WfsSJDijaFq88t0=@vger.kernel.org
X-Gm-Message-State: AOJu0YznooXXdudsb6SAwThNOWxEvaQq+ozsdNzoL2JpkDbNs2oETkbI
	hfmFWod1PTApi8zZiln/TGurfVXJZWhKY2SqprOvqHYUSoujM6Oi4FUieF2wIPBN+ITIvF8EZD2
	ywliAJVUHEy89fh0YmV2+uSBrga5fFM8+BFi+DhnoqNDZWhO9ptyGUFhO/3/HQ30=
X-Gm-Gg: ASbGncup1GgsiofTZ2ScVLPd80rpiYZZABCELk7gKYQhlkIr+T4paajewr7QeNR+AYG
	N8246riw32Dj+025HO4MdCUxsGtFjvZpCDQnMCpvtT/o6BsKyRk6mc9Z6jDU4VHiMWl/LKES/hu
	FCxiX1Z6DjbNweYs3xQOrqFWixf+fXcjAfj+uplwoDIaGeu9yYv2rq1jL14VhUpu6OtBrRPfx8g
	ZU/CIDFew8HsgdRm8mmGtJMS4J5QK2h07ibKGaC5at6WEsNRm2eGu5yODPs6nAqHNl4TvUN/l27
	A/brhBvDIYaBS73iYGDDGFGOMFsmQCXQGnVZdKqR5FTpm+cge+Mwv2Ep7q5u3Qx5jGuwAkMwPTq
	gP/BucUHeS3w0+VZ2GA9rM7BYQynq9lf1QPiPEE7duXimQ+Psvl46Rc7JRLdMd749bGxrXVnyMa
	z5YvNxelRXesQp81bTqglr8kg=
X-Received: by 2002:ac8:58c8:0:b0:4ee:4a3a:bd05 with SMTP id d75a77b69052e-4f03ff4ea88mr178501811cf.74.1765293313805;
        Tue, 09 Dec 2025 07:15:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXVh7Q/FO5up5b/G++0eFmJ9WKGEH2Sj4mAijYLfqoYPevma7RcpOSFo8BAf+CROwtlAz3+A==
X-Received: by 2002:ac8:58c8:0:b0:4ee:4a3a:bd05 with SMTP id d75a77b69052e-4f03ff4ea88mr178498181cf.74.1765293311235;
        Tue, 09 Dec 2025 07:15:11 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7b2465bsm5135862e87.25.2025.12.09.07.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 07:15:10 -0800 (PST)
Date: Tue, 9 Dec 2025 17:15:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 2/4] clk: qcom: rpmh: Add support for Kaanapali rpmh
 clocks
Message-ID: <67gkj62fytmyle3ju2pipm6fymbv4aqwjhprjh5f6efcdulcfs@tnbvsfrwkhcw>
References: <20251209-gcc_kaanapali-v3-v5-0-3af118262289@oss.qualcomm.com>
 <20251209-gcc_kaanapali-v3-v5-2-3af118262289@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209-gcc_kaanapali-v3-v5-2-3af118262289@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: JRzFADxQ6TUbBieqU2mi2UQljoHIOZUJ
X-Authority-Analysis: v=2.4 cv=ZZYQ98VA c=1 sm=1 tr=0 ts=69383d04 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=x2DRelJqk6z56t6zBn4A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDExMiBTYWx0ZWRfX4fAXsbERLyAv
 drhbGVJDipxDxfWggeNIQdVkjOFDOoCNA+wpuA1E2WKy2Dd7+fEDXsxZHKARQJ9BYPpUzq8vhxe
 GtH2NeK61DGwEfnB4XLL0xnlgUmByeNMD9512+TydJ/LZW8eypQJl6keRQI7RstNS3vpe/I0RMu
 TM4Ufa5i2vHQY9M5EPg3ZcXKUzXykeFXrBBDvz+S9RXbOSpPNLii9HkkCtYHbp7HRodg3HrnP//
 Df64dYwQO+h0O4CkfytjwF7mZteNALoyFjlZu79tt3f8ejhz+2LRrnnQXCTdofttq9E/aoXp+55
 RQettVyszmtXOg55MNFeA4WYPFxv2Mq2goH8xu+KHbTEWTOc56uO3P4OjdNpJxhKZRA7cSezCEd
 av+fEQxldZu8ebZ7DKp0VfMq4SfqGg==
X-Proofpoint-GUID: JRzFADxQ6TUbBieqU2mi2UQljoHIOZUJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090112

On Tue, Dec 09, 2025 at 02:19:25PM +0530, Taniya Das wrote:
> Add the RPMH clocks present in Kaanapali SoC.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 40 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
