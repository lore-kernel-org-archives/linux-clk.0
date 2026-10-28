Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793209537;
	b=h3NU6u4zkeiRmUsmQq7rK7UmmE86KATqA97TjAKfvZ+uSC/ZAZPq9rz12r9HwIwApHbI
	 D6sKrdK/cmcso3ipdImBNMAhg0piaEDhk1qjAhttLVzT72weizynJ4yXWirEfC5Sc6JVu
	 vV/WYl2xhmnwAn4vVrOj0OhQra4wCACngsTYqCA2O0UiO7GoVOL3nHXCi7S3qOAoYUnys
	 rjxf5E659PhrDXwaKfCCCq664PnDkNYBc90Vng5NS3407bAhLgKnYnQUChqaNA6UZbTRX
	 aCb1sXSA/t9UijMXmBe3pJvmOucQl0C6ziv+eLX4wHrvoyRGmwbfXKRo1xJbb+efM7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793209537;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=KF/Rc89LdTq3PibZB2FPeM3UBuCsxv4hiWwAReCHAJ0=;
	b=zeTDjUijNcg8mOd491hDPv650aFjXK//fF/UV8AAObyHNvVXyPlw0i+6JzMtRWX088lb
	 L4Ds3DD0SKMbyI+FlnHXX/BdCQ+W2/COkZLT6VVDkwKpPrqOSyjyaGtebkJ77HpTHn8yu
	 UrTSDNgKRsfKxuILOf6Y406SjLMlv/4a/P1mm/U5aJTRI+IQD3ZI8un3UZKjI71E9yZGD
	 W144n6elOcB2ACVjByl6HuIO7vToGldX0UyNECM7+PkQvlLR1wRiO4W5+5OdQce9VzQ3K
	 cMMc1jxsFYOSLp4pWkryL0pdf/z4JO+OwYB316svaKBVBHU9o/dIfwlSPRSZtvTOBUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fzQAUgws;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=faxuhLVT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855A8606A31A
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 17:45:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 855A8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fzQAUgws;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=faxuhLVT
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFA4gW2543212
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 17:45:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KF/Rc89LdTq
	3PibZB2FPeM3UBuCsxv4hiWwAReCHAJ0=; b=fzQAUgwsZXJhe6CvIVZRfjqsi29
	VSElBTbGsvZWRn2yOKofbTGJ1V/uRgv1Sz6dd3kDg95IaCjrCyTbPFJz7hHV87et
	gBL043Mmcpw9IHiGFH85WzM9fMhpdkFRDms2inV/ndT62dfQ6vvf1RdD2o593gUA
	dSUBdIWe07OFVV63TUl24gtLhk6nUXOLtUp8Owm8Dk+hCQpUoTSqHNzXFyfmyJ5v
	D9jxpTtjKUTxpiITjq+BlYWb/ekSMDhr3YQPBWOaoRNCy212vgc0FpkJ5SvrQ9rA
	P5o8dMdycX4R1gGh0d1ArvJqWGo3AZ7eECWbia2Jv9+X3U+Z7C2zCqoev2w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkkehrqkg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 17:45:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cbf2fd504so199910785a.2
        for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 10:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793209530; x=1793814330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KF/Rc89LdTq3PibZB2FPeM3UBuCsxv4hiWwAReCHAJ0=;
        b=faxuhLVTaFebAWTwPNDmE6WcmuQAEKCJ3ngGsNGmOqWbkK819yUQR0njHTDltWNN2/
         DNcCgqcdMIHGh7cf+rB8fjWYdPFaQI30+0m+aLUgx4WR7xnFnvAt//RZv8/UvLj0/5eW
         46mqLI+MDunefO1D3po5hZrkfQo3BrJmWjSdzUzN8rqDzx1r4cLEXowo8reOSMDLnDQk
         BgefcTEKYd7ikULrsdXXQ8AIq+1OkbFGcYg4riZzF0uo+ismaCjRqh7jqkuv7sED73RS
         GWrK6vxy3vl9WesAaJkymmvYxY6NgHXWsynRJSp9R/EieB1okpbhOg97iA9IsOpxadwg
         XfcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793209530; x=1793814330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KF/Rc89LdTq3PibZB2FPeM3UBuCsxv4hiWwAReCHAJ0=;
        b=v09n/BsII6Hd1YpkALEYMVi/AIrhazQoSuUhk+zOYD1O6RLRzDaR0try5GVs9xNroY
         dhdK4ykSE4Jq1fCGNDg8TxGMSiWzE9WMmYr2TNekt1gkNz5kKhnYj/jeqWDmWLjxjTPC
         cPBE7ObU2AXd7UZSV/lAscdQq2AtwYKopZ3QdDPy/CnadFF8JxvMs72jdDwBH0+CtN+3
         gIiJnvp/yvwJNJVNqpk/cGF8NkhdYEhC8mxeylSWeNG1+uSGJuyWqtDElPAn0uAMoSId
         uEPFdIo2J3rcv+7Jts9hZT9QopgCHoCJQFt2kCKWW4DY2t74pDMC7ZT7+3DsZJoC+qIx
         v6PQ==
X-Forwarded-Encrypted: i=1; AKwUvByIm/LN/ehAsivDtMi2sQbR44KkWyOsq2yQ2HntLUAxf37Sf07YkqtodNU81kysCKVIKVCwxypogOs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLkQKjrySdeGiM1Q3YryjwfodXN9We4NI78vMJVWi+ObE0zlZw/
	+A9nE50kqGZf3qa4rmuBlu9/KK2CxP2BWrvjkCf2RHrHLdnoPoLVkEqEeD7H9MvIY4OPA0sTeJM
	hsoEnYD5FAZ6P3ykG2oWeOeEHxnq/5SFTWMyG2+KCuJ1M/3ss4osqd2hYb9pMwg8=
X-Gm-Gg: AYBFou2mLiaPQ3+4Z0xIfKkYX+ygjw3F8ynnCJxFI9X8xVqq14r2ZAafDbf3hCPdMT+
	9S2XmHIVt5X1T5skh1vbc1mDeoKYI68YM/9k1FzhQbVjhMzqlIek2DmwSXSjNE1Bl73EDS/0Ehu
	wdOwovJp1cEFYzFnpeqs5btYsBGAD6U2avOx3mAX/EuH+Fg+Oa5BpLXqHhoxUpKTEZ1lNxQPfnI
	4V+Qsg/4wrVpdSCu6rhf9zXlCDsYyjl5lIOxZ1mzgWRJRG25+E698UtGh+RjBYJw8XBaq+lAkSz
	iGAxFhLGfe40T7J7Ej1URYNFDbsTEV6DWYEHo8m/staKGKNvJkizSnJIEuVanx8YcZYVxHwELlG
	Sv0t4vc4VPJssIYuUxK8m4LRRjTdpXFuNg6uTIdoXwajowMPxuD+YjwRLQwFl7wtL+AhI+lUusw
	==
X-Received: by 2002:a05:620a:2681:b0:93e:d364:c9fc with SMTP id af79cd13be357-9440896dc2fmr489029985a.5.1793209529630;
        Wed, 28 Oct 2026 10:45:29 -0700 (PDT)
X-Received: by 2002:a05:620a:2681:b0:93e:d364:c9fc with SMTP id af79cd13be357-9440896dc2fmr489021085a.5.1793209528623;
        Wed, 28 Oct 2026 10:45:28 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa813d295csm6842485e9.7.2026.10.28.10.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 10:45:27 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: atanas.filipov@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>, Bryan O'Donoghue <bod@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sm8250: add camcc interconnect cells
Date: Wed, 28 Oct 2026 19:45:23 +0200
Message-Id: <20261028174523.3514860-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <a01d8d86-740e-4a25-96a4-d4dfd664af5e@oss.qualcomm.com>
References: <20261016170701.1504338-1-atanas.filipov@oss.qualcomm.com> <20261016170701.1504338-4-atanas.filipov@oss.qualcomm.com> <usade5zkrncpry4ufbdtaahoa2zyd5hx7tjgfvzfte2aqbkgs7@t3mej4maj6za> <3e5b7781-20ef-4e84-bb62-29a081c26d8f@oss.qualcomm.com> <x5x4av76vm3swozvwe46uq5vz2ys7bvo4bducpp7flnmhykg65@pvr3znxyktje> <a01d8d86-740e-4a25-96a4-d4dfd664af5e@oss.qualcomm.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: p0cDPpsbRJlnTy9RET8eSWz3zdUtucJ8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA3MCBTYWx0ZWRfX85lFIWjYWb9C
 TPR/GdMMsUbPfcFA2HM8cw5xAPcH9OOcuMlfBgcDbP86ru868PmwlCTf5JGOL7AAKEt7LYPlow7
 X8fXTG9uaiV64qNSMH/55HTSTK1pPFe6MgRfRaqyucVz31e8r6dldHT/ntEg4Enw8DHnCY7CF7t
 y/s1TYn2DtOfVXFivUOgGA/T7Wtg7xiDEk9Ky781pnTmeazPJd3ludm7B8VxCNM7NdOK8T5KLQD
 VK4jC1z2MvN83TE0L66w50uEkBrMemW8V9KW+f6CN88Fr1HZYhEfN6EpSe10PasGAhRw/HPzrPt
 fxJBRG4qML/AcCTe8coumuNLTPb427bKXNq1Y02FN5RGjIK3z/nkv3D2vqpv+f50QxUZCtKoswS
 rwfozsgYEyrDtE86Rz4wJYR2dd2R6BiqXPIe7HA8+MEmquIqJBjSkYhhQDqS2wBSgU4PZ2h2xlM
 Lx5JkcsUOu2yXk4TcAg==
X-Proofpoint-GUID: p0cDPpsbRJlnTy9RET8eSWz3zdUtucJ8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA3MCBTYWx0ZWRfX2W5BTekGGdbA
 02z3q9kF6+W4pjwwoRGwj+hMS1TIfbK88uoIIlc6PGmFMZ3adkqfoPlE+CVCzMiANXQVfvJv7uH
 f4Dm6/GtyPvsj4qNMza1oFnhW7IFZgw=
X-Authority-Analysis: v=2.4 cv=bYv+w+PB c=1 sm=1 tr=0 ts=6ae234ba cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=CBOP4jDC0s-gxYZSdkEA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280070

On 10/20/2026 3:49 PM, Atanas Filipov wrote:
> On 10/20/2026 12:45 PM, Dmitry Baryshkov wrote:
>> 3. Add minimal VFE nodes and let camss use those. Converge towards the
>> split VFE (IFE) device tree.
>
> Agreed, I will take that up separately. To get it right the first
> time, could you clarify what "minimal" covers:

After going through the options discussed so far, I think the VFE
child nodes you suggested are the right approach for the per-VFE
votes. Below is a concrete proposal. It is separate from this series,
which stays limited to the icc-clk conversion as you asked.

Why a VFE node is needed, not only convenient:

 - The VFEs need independent votes for three things: their own clock
   rate, the MMCX level that rate requires, and their own bandwidth.
   OPP is per device, so this needs one device per VFE.
 - VFE and VFE Lite have different rate tables (on SM8250 vfe0/vfe1
   350-720 MHz, vfe_lite0/vfe_lite1 400/480 MHz). A single
   frequency-keyed OPP table in the CAMSS node cannot describe both.
 - Today nothing scales MMCX with the VFE rates: camcc only applies
   its fixed required-opps, and CAMSS sets no performance state.

Proposed minimal node, one per VFE, as a child of the camss node:

	camss: camss@ac6a000 {
		...
		vfe0: vfe-0 {
			compatible = "qcom,sm8250-vfe";
			clocks = <&camcc CAM_CC_IFE_0_CLK>;
			clock-names = "core";
			power-domains = <&camcc IFE_0_GDSC>,
					<&rpmhpd RPMHPD_MMCX>;
			power-domain-names = "ife", "mmcx";
			interconnects = <&mmss_noc MASTER_CAMNOC_HF 0
					 &mc_virt SLAVE_EBI_CH0 0>,
					<&camcc MASTER_CAMCC_CAMNOC_AXI
					 &camcc SLAVE_CAMCC_CAMNOC_AXI>;
			interconnect-names = "hf", "camnoc_axi";
			operating-points-v2 = <&vfe_opp_table>;
		};
		...
	};

 - Only what is needed for the votes moves: the core clock, the
   power domains, the OPP table with required-opps, and the
   interconnect paths. reg, interrupts and the remaining clocks stay
   in the camss node for now.
 - VFE and VFE Lite get separate compatibles and separate OPP tables;
   VFE nodes of the same kind share one table.
 - CAMSS populates the children and uses each child device for
   dev_pm_opp_set_rate() and its ICC path. The OPP core then sets the
   clock and the MMCX level, genpd takes the highest level across the
   VFEs and the other MMCX consumers, and the interconnect core
   aggregates the bandwidth with the other camera consumers.
 - Without the child nodes CAMSS keeps its current behaviour, so older
   DTs keep working.

Child nodes keep the camss node as the single entry point and keep
the change small for existing DTs. reg and interrupts are not needed
for the votes, so I would leave them in the camss node; moving them
would only make the child nodes look complete without changing what
the driver can do.

Does this match what you had in mind?

--
Best regards,
Atanas
