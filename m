Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668FE25CC57
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 17:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787334572; cv=none; b=nvxvdTVuo5XgQ9Ap0L1OfAHc9CKTVA38aWKifIk+zkyawpvzU13lYb6xyZ2/PHLUUcLBiALInE+f6mGVtbnOEhhBmp1jOMbGp8mJfIX07rMSLr3L6pupcpRex5IX1k4nMrY0Jr+jb9c9H/WRgrmYhJCf3erjimxdwWxNbaGzBcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787334572; c=relaxed/simple;
	bh=4SfEPvSxa0g/iepOJSXI/hcu0BFIjTX0Zx2ubVBcGQY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f3w1HeDkbqesQwOSjOY9wIvJQZxUwGucjt11qAeB/ne74S4GHE+OClzdnU3BeVER48aaIXufDU2yH4iH2ez6xV54h7011/r6TdZXUeM1KQwXvdYpIkFqBHdQ+fRmQlsbKZUzTo3uESKvlUzMNhzi1ibrdGPlkU30nGX9QCJSjz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GA3doTlM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B/0+OEyz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GA3doTlM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B/0+OEyz"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LFmS2R2645699
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 17:49:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4SfEPvSxa0g/iepOJSXI/hcu0BFIjTX0Zx2ubVBcGQY=; b=GA3doTlMfKNCtpAG
	rSNoKkBD8C/+9RloFnwW2X+1fwwwZAk9Vv2HXY5mrJXE+QVa2swtftoE6ewjNpDz
	0DnHlvQYCnluEHopB9mSWC/d9Hoe9MJbunxZ5ttIhWd/apf6q6YfppFna0e2EWNI
	CtDEnarPu070AZ2y3jnd/Ynf8ketpdBibgyMkJBd7WEhA8u9hsqDdirzwOpJSZbx
	ULSA2zf8cxP8iYuit/C+HhBhJHBi92uxEc6uEgPV6ZOFRWV49imXmiAxHoraSKFQ
	4DfUFeZyyspsr7YGba9dIqt/YvqHEkUQVPnSepSjI/T9bmNwFT5zCTCVBe7kOuef
	HWbF1Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6ecbb8cw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 17:49:30 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb835525b10so1610438a12.2
        for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 10:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787334569; x=1787939369; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4SfEPvSxa0g/iepOJSXI/hcu0BFIjTX0Zx2ubVBcGQY=;
        b=B/0+OEyz5R5pRUM+QiPU60BuSlELkaFXm8n8LMsFK8xD9xCGMIjIiyb5sLJf4y2zqQ
         neBY2m+1O0x7MWuS0U3Av4r79c0/uA+W90gwtfk3n5ajFW+1UtBhuQXGkfYR6OjGNeae
         eoDvPR+iXS6X4/oqaUpRXxdItr2XfYTlmWIv2yS/yI7E6/7BEk/uwQAdbRpYIC9j6MHV
         l4pDHUFmcS8nz7HCQuNiS295AbSg4iEXAz2CmlOmaFgiA+tmqhFXq/uZwwZRYj6oJwOQ
         h3M9GZ7JP4cSTyfapdfX2nKMx8fiC2HDuHht9BruD8NYSN9BZAEgSQn8l7gWmvtdi5E3
         9xgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787334569; x=1787939369;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4SfEPvSxa0g/iepOJSXI/hcu0BFIjTX0Zx2ubVBcGQY=;
        b=MBQxAj8JSeoI08MKD4vWdn4fOZRxUKl0vSZJ/aXy2YPtRjmNpU/Srg1mse59y8K1Tr
         2IjnsFJJBm8rqt8l2UkkE4wOmu0tOegEDdSiTvan1u+D7haIqz1hNwzCYhkZr8yP0C0B
         GbkHqF3OLSfzFvM9sDK/cXiFUnELJAS7J/mmu7yo7Ta8TkAE7na69vZYhs8HBjCgTQ6r
         7Gm00Lq3OpbXeL4c8N5wjmUgmogO4GL+NnxQBlPi5Sje5iPapI0OGk+U0Y3cmc1C/WF9
         2xhpDcPFwFu/ezLShpY7xzmlhnVW+AHa/8uGSg/RZH2RHPthhWzHjJ8f/F+01Pic99S9
         JtDw==
X-Forwarded-Encrypted: i=1; AHgh+Rp7+pPXcuLASOGjIe4X6dZCily7OkvSlabIyu2KpqZeAgC/UE/sW703E8h68h8e4ujSi+Pa23lL2Bw=@vger.kernel.org
X-Gm-Message-State: AFuF++lrm+tKxHPG5EmTvX8q8BGsuvrY5EnrdlpUGvyTrB6ivclS5HEn
	x2GKzbJ5JAePswYo3sVRB8ZmGxw0PovHvID+L632qgtL6XUBvacC1NO/nqmccaptLcIUzzbRgIY
	RRkr6co/St6NeAPcfXToaAKJfSgXZ3JNBS/z1dFLScbe2T+votP5Gryc3NUONXl4=
X-Gm-Gg: AR+sD133AHn2Kggd7GQ5m4BM5Nri4Dnh/1jcgdfepxdl6DYXMNH5MArFeDeS05qmCRy
	I/VtFRwvYlat3eRHSgIdEc6RwgT1BR7OQUib24ii+rIlPZmnJSKRloTLGs0vm/C9E0gi20D5nP3
	OJ+Rz++z/jkXgLUhVyMuQZxwKhmUzBM4OynSbui/WHj2Vd6LtV7aOq+E1uIt0AaVnOLW8KtUB58
	OHer1CpFVDqmhdAl10cWELfjwoqI15DoI0Kk3Ozs64BtAM4XpwGs3vm8JAnkQ9j2ogul1rUz25c
	CzgZWC0vYAzmciiYdPHZcjhsjY7k/TVQQTCrdo/Uyzcjw5J5lhE5AO1wkEf0PKI9N9VTdMD/Xrg
	5KSpFVaUAfldDq6bOzQ==
X-Received: by 2002:a05:6a20:258e:b0:3b3:2703:115 with SMTP id adf61e73a8af0-3cd4bbf65a8mr870762637.16.1787334569305;
        Fri, 21 Aug 2026 10:49:29 -0700 (PDT)
X-Received: by 2002:a05:6a20:258e:b0:3b3:2703:115 with SMTP id adf61e73a8af0-3cd4bbf65a8mr870700637.16.1787334568867;
        Fri, 21 Aug 2026 10:49:28 -0700 (PDT)
Received: from localhost ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf10a94dsm27473314eec.15.2026.08.21.10.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 10:49:28 -0700 (PDT)
From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prasad.kumpatla@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: clock: qcom: Add LPASS VA CSR HeartBeat pulse clock
Date: Fri, 21 Aug 2026 23:19:25 +0530
Message-Id: <20260821174926.2096826-1-sarath.ganapathiraju@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ann0rJhd0T6x9iLG@baldur>
References: <20260806-master-20260805-sync-v5-0-0ff42e9b6431@oss.qualcomm.com> <20260806-master-20260805-sync-v5-1-0ff42e9b6431@oss.qualcomm.com> <ann0rJhd0T6x9iLG@baldur>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDE0MCBTYWx0ZWRfXxqIkebofrIQ6
 CSBbyFwBseW5bPNe/xn1B8mvGc875QS+UaTfaa898sv64Mvd/fbYMLAgA4j/0Q8de8tzARrlAiO
 ABJChNJCNDcA9rV7rRV99um5zA6ZqQefZUR2GNKxU55327Co6uXXMFnGEdV9bDvBBZVzWoLWG1Z
 MUuKkygomPwB9YSxI3ddCDLoHeTpgJSLb1atB/aY1es50UvmGqepDNLNYwE5fvoDFeYvXZSLzhX
 4S4pWmVsFPU/5+QA8Rlz0ZHUw58L3Ml1IuraRraOqIFOYMEmwIkeF6h+btrDUS/jFSDll0uijJT
 wq2plRMksWngkPtmgC7lA4kKRHNQ5V/Xvp8OF3PzFp7kqa4Jys5zhwqfKR3l+qh5EfARytY13A8
 k8BB7NlWRvhpqln/EYC6nqlnkdNwIhNEVAYgsW1l9iFoZ+paj/wpKBlTq273gbsmEvPe3PO5ris
 KCoMUwW1Am8wupBh9eg==
X-Authority-Analysis: v=2.4 cv=e/s2j6p/ c=1 sm=1 tr=0 ts=6a888faa cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=xqCfmHQ9m0fvC3ZmX54A:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: fLEMNz05XRPuBp-k-RV1xgbiET0VZK5D
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDE0MCBTYWx0ZWRfX/Hlf/qLOuj/u
 H8F8Kcf07yq9yddLIKCW4AVsDcjnGgGWt4c1A8dNQfm+bBYI4etANAvz42sgRRwcSEir9SF48Kd
 d11Ux6YwMtDwZ8X1Sxv50+NH3zglsT8=
X-Proofpoint-ORIG-GUID: fLEMNz05XRPuBp-k-RV1xgbiET0VZK5D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608210140

On Mon, Aug 10, 2026 at 11:01:13AM -0500, Bjorn Andersson wrote:
> Hawi is a proper noun, so it should always be written with capital 'H'.

Ack, will update.

> If you change this to <0x07eed000 0x14> you can drop the
> address/size-cells and the whole soc {} level from the example.

I will drop the unnecessary soc wrapper and the explicit 2-cell
address/size setup from the example.

> That said, is this really a 20 byte large IP-block? Or is this part of
> some larger function? Will we have overlapping/conflicting mappings of
> this block?

Konrad clarified that the binding should still cover the full VA CSR
register space. I will keep the full VA CSR window in the binding and
clarify the description so it is clear that the current driver only
programs the rate generator registers inside that VA CSR block.

Thanks,
Sarath
