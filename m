Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA684D0CD7
	for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 20:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790109443; cv=none; b=NstOsW/6HkTQUrGvkSaa0d5j8dIMKZp967agETITr1usAZmTaRAVJLFD+vdZb6gQyMpnzd1W4HTryEWs+s5xni1PXFMJ8NVYfr+1Ldhyh1aADlLuQaD+wsnaSopNK6rJwWD/TFZ8U9HFiHKIrvbDmzUCHyVKALmbrr9yaBxcMUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790109443; c=relaxed/simple;
	bh=aK++3JbYzV8XbA4SqPzyNT+HdEqpAKIXLsDfXp5lw2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W83LmFxZaKTlv9vcaVZp1WMShqswrE1wJ3ZFQZz3ySdwdS2I2GMgOWAEu4EqJ/JyjypVVTLPL3yHp5MMSZ8osfi+trm25edzA51OOUcUn5w+m9fe7jG/CHt/37wZFh6berYuInkHP6M8BRJXXwIMNJvQRRiSqvARIviJGrzzt7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gR0h03wv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JhLdyqu/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gR0h03wv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JhLdyqu/"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI6qZ5178641
	for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 20:36:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cXyXo8Mcq+VUz2SeeRLSBrOs
	vJpMR+7hdf15S3RqYeo=; b=gR0h03wvvyQo3q6TcL0ZjtimSbeIzENyUxLSv4BG
	xMjb0MN6qBwVymsXhcAGlFstwr5MBzLih1JyeyRh4uGwajk6e6Yc21gSwlDNCX+p
	wVeSBk3lTwKG0CQjlL6datOFsthDKcA/K0Cyb87gf9jPYvD6pCKP7JHcNsGDAgnu
	FDratzjSfvKyP7F9wBnCNEQ7ZFLj4/meOKZiIY7rWdYn5msiXZ1l+3XV92zn1Wdd
	GXs3ujfcITSeOY+9IwZslID0aeUaH4rfgTAQScTFV4Jqq2x5uZRlCGjUUXTR1ERf
	lTLYYOBVvBI30LXH0H1/Xbx9K+ZexCP2GUCw2XDtVPDrVQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guuec1y5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 20:36:57 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-98331b577e4so195323241.1
        for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 13:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790109416; x=1790714216; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cXyXo8Mcq+VUz2SeeRLSBrOsvJpMR+7hdf15S3RqYeo=;
        b=JhLdyqu/WzTulXreM+9Nwq3DjWPPd51GfyKX7AuLy6TEoyBQN2fOGF4nvqpxcAddNe
         es258lPt7UQM8c78LJosz/ntLEOXCTs6IkggEohClVryVbsSkDJSHL/RYnsvPgpm80lZ
         yK8ehnh1YmeXyf97vDjeAmYcWp+MF0jsAysTlcs0Om7BkdQrERxOqWOU9M8N3U19KjIC
         9Rk4SaEfiwdYCCNoWrA0E0EpwtuickQ8ucvoFnDeq+lFYBLmk1+0tbg+26ipUii2UGiq
         EsqMR18T9bKarQvNbgPfwQj+N4zM6mvBbtidrHThbLPp6FTN79Rs0Q4SrRJLvN2J7Vsd
         fG9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790109416; x=1790714216;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cXyXo8Mcq+VUz2SeeRLSBrOsvJpMR+7hdf15S3RqYeo=;
        b=EFpl579QLM1b21mUD16wMMstxHKXSy0QexQJattRPcd0s+jlBuZ5ydQypvyat6QIFw
         X2Py8DM/Ikrbr9OgrHU7r7I3+e/UaPlhK+mOMiWya+KHRKY/3usLclHPrwrwzTeOdYKg
         xtAlgFya51VQMIYVKBX5DL/jN8Q8x9WQUTuDO0TbJSFFLCL9uV5QDe95sB7gGvLX5OOi
         WxmOMrzzZIoE2uOuQi5JLd8YdsmS1fQTGS+R9jI1z0bq0M6MuQbFD+ulqqK+y5mpr1Ob
         vDT+jTA1Y5dZRaNNnSrYzaW81eA8DXdXjo170PTCGGIJKnAdhjhESl1Gp5Ksk9CRc6H2
         3m4A==
X-Forwarded-Encrypted: i=1; AKwUvByrPW8tFAdEgHGr/qPaAjFkC7He2ZYpIUPog6J34ZCPvlE5P/RrM0UxeKg84wc8Zwi3aYXIXQxr/Jw=@vger.kernel.org
X-Gm-Message-State: AFuF++kUrM5OEOlVc25Xj877VmBd9DVUau/Pq5lS50LhWaSnJnlfYAdt
	Pt+5Hc04pdi6/8lwfWwOrpWXHsQSnaqgeohs7ViaNsbQEtYvDoGI6GOLyHHc9QAphDzqcvho6wV
	S9xbCJIloUtxyXEcm/HgvT/sUvfYDGhMEtxx5AeK0MjNlla273epBVjY4kUzbedA=
X-Gm-Gg: AYBFou15FJ/W3+txvp3phKtwflr/9xPWicb4NNHrchG3f6m88keLr9CoJVD3o+36juV
	bxDR9cd2M4xWqJF87oDje0ZRznyPL89R8gmUzSM3DEb0QWNpRuAMiaY0NNgMBeFBr39xnLnLl9L
	icbDUdBv/qtbjnki0AIiA5LYYB24cSBbtGAK/yYDG8h2nQYn5kbOQnI9ZSnCNsKlGKlm/S6VZGp
	YhWpovGaPBsPhjuSQdkUI6Y6Lals3oaRJwb+DHwjuJCTkIN8SDxpjXRpDuSbebqsA27oJ0Tcjic
	6ZjFHx43jqR9RPbuTiN9pdAO4Z/akmkznUKDDyYcsfB8Fq+cH4WEcQW0LoZl3/9Wr38v8Ftf6rk
	nXuQB3tbhIlxNFw==
X-Received: by 2002:a05:6102:6882:b0:7a7:198a:c2b5 with SMTP id ada2fe7eead31-7ac1d2d4830mr739408137.29.1790109416137;
        Tue, 22 Sep 2026 13:36:56 -0700 (PDT)
X-Received: by 2002:a05:6102:6882:b0:7a7:198a:c2b5 with SMTP id ada2fe7eead31-7ac1d2d4830mr739375137.29.1790109415566;
        Tue, 22 Sep 2026 13:36:55 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdf3541aesm5332835e9.0.2026.09.22.13.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:36:54 -0700 (PDT)
Date: Tue, 22 Sep 2026 23:36:52 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] clk: qcom: Add support for camera clock
 controller on Maili
Message-ID: <kjj73o2paa2psrd6lsrszmavkog36v5slrxlctr6d7byyyv5xz@6ecvirwrodan>
References: <20260922-maili_camcc-v4-0-87704b664dde@oss.qualcomm.com>
 <20260922-maili_camcc-v4-2-87704b664dde@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922-maili_camcc-v4-2-87704b664dde@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI5NSBTYWx0ZWRfX9jrpZpKZnzcP
 7iJtEi1abrsKpr0N9KI+vMnpA3NTNjoXWJhPZ1YjjsC12ecUWS8yoLS+2Pknz9T0KBY6P2O/QyQ
 MJOlQnmCcNwbruajJ9mNaLT3cuD/XbTG7eCPW0b68J0pWOW5oOTumLxdDkuLgj5LNaYh9xlpDPw
 6ri6nBJKP5Ns8VFywa+M1w8BsPQnF6iY67G2tknwdKYt2EzYqRxOs77iC7eK9Nd7OphDsyPm5Tv
 wS4UuciP94QbvrCIDgTbS5BM4pdkA8DbQXV+wdVAmolX4ZGdnHxAH6GDC5PXzfG22dZZ5Y0oTxC
 J7wADJFVxEPHqlg7ZVANpsT3Mz3CZYfxzom1SgYwAFXP6xQejzjs8KEAcy0J/hD0kFcq2f6GsCz
 iR50ITazw2hzepCke90Likdj+HB00MZCghbUY8yn6DFlmXfqAAy/urC5Ke5cD2kD328fGyr6g21
 sJngeEmxmaZlfCPGTdQ==
X-Authority-Analysis: v=2.4 cv=VKdIDNPX c=1 sm=1 tr=0 ts=6ab2e6e9 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=3jvcJnBrcLkHgcWL8XUA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: zBRY-Zq5L316Cbaeipc-9Y-KfpdW41Yw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI5NSBTYWx0ZWRfX+iqH/L49zhK8
 gBtciC/fiQcwGeI1sHtbH8YJIoY5gDba9XjG5ZeAUhx5KGFGNxPoVfuffjhRn/JwpmEKc5Fcv7f
 u53Wya+JgDKac3jxFXDBIvw0hflE1aA=
X-Proofpoint-ORIG-GUID: zBRY-Zq5L316Cbaeipc-9Y-KfpdW41Yw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220295

On 26-09-22 09:26:38, Jagadeesh Kona wrote:
> Maili camcc is mostly identical to Hawi camcc, with a few clocks
> removed, frequency table updates for a few other clocks, and PLL
> configuration changes. Hence, reuse the Hawi camera clock controller
> driver and extend it for the Qualcomm Maili SoC.
> 
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
