Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B84495023
	for <linux-clk@vger.kernel.org>; Fri, 11 Sep 2026 15:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141249; cv=pass; b=cxwIFyXvI2oEOqm4Fm7SNoOiLHWJOaDc/HBgRVD2AMhqAf6a1hF2uDhgtNQsu3FjL4GsKeu3bi6VjLSGsiSbVkQvdr7OHmFmhSYYzHY9sZEMdAUiM1fBi9/8x5/D8Vj4cTwF0GMf4O2/ppS57wYmSoyDTFo6q8IS9Un9gQOLTN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141249; c=relaxed/simple;
	bh=kQXQO0oghS8R0ta0G4UMFCbDP7svrBfBTLWTZIZ07no=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pjOlHdaIcmLre5tSdn/Aj7qG4Y85fKtm0XoQFg9NuxQTH2FYfhztnGhT3GqS+K+9tj6ahC9MiRZrZ6JU2Fop3VV3jkkN8dO36bYAAJ+3Mr9TRIdSVSB+/WKwFLp4sdtXQhxeCvSEX2tAQD/LukU1M+8qM7mxgMs9ux/kcY84K7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I3TZVEPX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GorZ9wpV; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I3TZVEPX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GorZ9wpV"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEmYSM3962506
	for <linux-clk@vger.kernel.org>; Fri, 11 Sep 2026 15:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9gVRbTQP7+HXM2XZul7tJ0soNXDAB0XswIPF3ZiIrx8=; b=I3TZVEPXZXd1Os5M
	NrODBZZh7T1xCUBzKFyUjkEAOKX+RRhB0xUdUtqnXOD7wpDfJgVcM0P8ZAzbzvJL
	17AjNsRXhsgYC5/xF3Hz+eo0TceSARvcGYLMIQwqFJRdfdKtgutrri/KzKcvQE7q
	28Rok/kNb+0XzN8xl2dgjNWrDHiJ/ENoqsceZe9haNYmE2I/eUyUlVT2J1t8q6QD
	SLrrbQEDq93v0gaYF4B2SeI1gp521usXrUP7WHGlDJXSRZNOLmz1u4BX4hHyEwrx
	XGTXtD2+scqMlbuWYo/tagR/1XZRpd1B6QX0sGpdvpj23BhXJClvEu8QAj32QnDw
	vQqPkA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmfbbhgtv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 11 Sep 2026 15:40:46 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2dc92350888so16746335ad.3
        for <linux-clk@vger.kernel.org>; Fri, 11 Sep 2026 08:40:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789141246; cv=none;
        d=google.com; s=arc-20260327;
        b=D5dz4Q3G5k3SUsXQ9dzydYnwtpw4lZUTZ1sFYvVM8KsorFu7KXcCt6FLqqxIObjMyM
         vMsCLxhV9BR4nkXW7RpXUxujg5RgpKV4zL8+ihMom393EuIlBw0+uKc9Cp90ou4AYnSy
         TYsQS4jN3XIEXbMIAOY8+GEMtEr5XWB+ZtEbIh9E3709TIfHiRpyWhD1Hb3AS4M20iGG
         bI7FnuohFHvC7qxhGwrwKwMwP0VrysZ4B8ytYV7KQ0Y3+/vUteWbYSga54BWA2FYggxl
         yzSMERQqQa4eMsPDZD23h4bct3Kw68tt8fAz09gzbOUMrdTMvG/A3MXihMiXVIJ0fE61
         MaFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9gVRbTQP7+HXM2XZul7tJ0soNXDAB0XswIPF3ZiIrx8=;
        fh=k2MJfYxxEoaiWPw3BMqJh4dU2Mygke0ejtK34V9ybg0=;
        b=HE5uxUKRXlP5mZ7a7Jsz7CE6RwPXBOR8pghC43M3lea7X+Ly/JlND9gS7rFTixBtSW
         cx9izAgib8X14VU5wgoUohD/HbrDVX7H5qYmcd/tyH6JpfQp/v2ZpHjzkx+smMfzB3uK
         Bte61lVZW+D2M9IhWVaYVezTQD/3dY16NVoWJXi9D1z/R2Wn/pEEf1ogaLxDn+s2+TTX
         AMUIUkg+o7YwBEkoaOfCVkqdIXs7Iz0uJp4zewzdcsfHkTXCWg0va32b53JpaNAQDF3N
         kv/ncNnbLL/ztP+i+1o34HAI4ck2LKsEAFnez7RqFYbeImerw+vKoIJVjY5hPH+/8N2e
         jsAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789141246; x=1789746046; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9gVRbTQP7+HXM2XZul7tJ0soNXDAB0XswIPF3ZiIrx8=;
        b=GorZ9wpV9CtedjUZufW9tj8EbQQJ8CzKEV18Q/7f1bIR44tG+7SNNZhetOCFHOIcR5
         5lC+6Ds0UF26E+PhZn6lXLc2S6NeGra1tfz61Id5aOcySB3yaJ9Q5mC12yOkknCFObms
         yC6BpHUvgIAm07j0kL8rSQzl9uXvi3ohA85uZQbdzACnI0/lBpal5B9yCkNESAwnEieV
         zEPBzCcjrGuhK9r26EqCpWopMe2mNKPJZiQnvE/W7AOt447QQ7RyQad7BYFHuzAMVhZc
         82blQxB8yicaJiJNE/cJMXfvQde/+zDmVhTVJ2ftTgm670AImChN24bX1/qzw2WEWGxb
         63TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141246; x=1789746046;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9gVRbTQP7+HXM2XZul7tJ0soNXDAB0XswIPF3ZiIrx8=;
        b=S9TybwH0hjA/VntuCy59dstKsnLwzBXnbnKsZnMTsU8xxhB2jmCRMGh7aNq/uT5H5P
         wxc8ZD5Y76TFb96v5HuTRuPcNESmXdYFsGsRP67Cig3NW2BbRPGvN17E9oXrfyIsLX1l
         A3oDbU+ESGQ9OpnnsjT7LBiHh4D/MN1n4FTDmyJKce+LqPKdo25JgyQGHmwJTTEV9Bgv
         iATq/KcOvFTk/ma5g3PVTKw9Q5xCxNQEdhY94Vd2AK5W2IvKGRMVTirvjVEmC6hQMIXn
         xh5vzIVb2WlxjUOBBXVxzjORjRkjZtnVGdqdciXCccisYU75G5aC4wdulQr5t+IJDs0x
         bySQ==
X-Forwarded-Encrypted: i=1; AKwUvBwffguewk8AST5N9uN+fK2riyNr/crv7bmGi/AmM3No2xntskQae6tHWcOxxWFHRfMSKSaoaUQ3BNI=@vger.kernel.org
X-Gm-Message-State: AFuF++kMTqMbiWkOwqFpsU1ypnX5vjQJGkNMFV0DTIzZOgjmz3t8+cCs
	OyUhmzeA/ttevECS8cZZhodGiNgWeBBzGm3A8F8m3GsTEOGOuJ2hS3Fq8HmOoZ/D/mo6/52Ns0W
	VnLlDJKW3NvE2Uq/h/e3flhqzm0EW1bsVjRN/Ddajmx9vEB4VpqwFlumRLYsqJJL5O8/flnv2iU
	rarA4gl8u93BH3d6L79JhclXtHJ/Lhfl6Xkp5YjA==
X-Gm-Gg: AYBFou1JJqylgjXfy9v6bl0mb9iUq14swecxOKWGPwnU+MP2HVLjl7cX8iEuXTGeYTz
	7dAtOaQ5tQgRK2gmCQxWritRWeM+bKj/RBPRSN6obOsMjxXZFbkO/YZVjr8nSDPhCc3RDwlaCOi
	BYhHh8Iz72zbGg0+D7A4FckCqbgAYa2hcUhpaxvUQpc9siOVpuH1W3pR/XgQ==
X-Received: by 2002:a17:902:d551:b0:2d9:4871:393d with SMTP id d9443c01a7336-2dd2a45aef6mr95924735ad.21.1789141246345;
        Fri, 11 Sep 2026 08:40:46 -0700 (PDT)
X-Received: by 2002:a17:902:d551:b0:2d9:4871:393d with SMTP id
 d9443c01a7336-2dd2a45aef6mr95924275ad.21.1789141245940; Fri, 11 Sep 2026
 08:40:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260905153234.133217-1-tanure@linux.com>
In-Reply-To: <20260905153234.133217-1-tanure@linux.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 17:40:34 +0200
X-Gm-Features: AcwNN1XJiqHpLAh6BkLXLC9WoOCg1aSLupw2Vf07ULv13DKT3f9hOH1d-RT7-pQ
Message-ID: <CAPx+jO8oWZxgkWTv3v5odp8K2oWMY-KhJVR3U+iqY4mQ9LrG9w@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] amlogic: t7: give the MMC bus pipeline clock real consumers
To: Lucas Tanure <tanure@linux.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Chuan Liu <chuan.liu@amlogic.com>, Jian Hu <jian.hu@amlogic.com>,
        Ronald Claveau <linux-kernel-dev@aliel.fr>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: vx_5PdDUFVicoF9FI2_GbejgDgONcFGP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfXy7p9X8AyUfQ3
 jDZxo25+xgaXX6XHBpAbE5s5q6uDFeJjDNtYtcoOmCqrYnF7iAD02Og6gnsGf+tu0wBHV63Xart
 JQAJJ4CEXdDyr+iOB/Am9htzHUkae1Gs+bFeoPHDqyvVpKcuvBDBcIVGtcckxQCA8LxLdeOGlwR
 ZMRHKgsVX3u8uZ/RRbjle2GhL652iKEsV8vccEtemTHn7P/u8SZpeasoMAOzg0jYhdGKIRrmw38
 2TLPyPkFzIfp0kleTKfC6C+qeae8ziim3qg6edcJqUqYSm2SN8bT0UgL5X5gFL/RSshJY3tvsPl
 +XLU2XFCTAWPH/um1SMdTg5kp7OLho/OU60l7LW4ktt0qfrWZhCtAlzXNet1hSpMInqF8NIJ7bx
 +beMBxx74QtGRvEGbf50GNeh5LafwlKxQiygULZndxUpB8RLLy2GCW2u51GQ2yOJJSSJotWDL3U
 2CNOTNhHn+O+Ut7uTmQ==
X-Authority-Analysis: v=2.4 cv=X6jHu2Te c=1 sm=1 tr=0 ts=6aa420ff cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=NufY4J3AAAAA:8 a=yCDuxKIkwSfSSdlP9cUA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=TPcZfFuj8SYsoCJAFAiX:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX/qvi7Qp7YB1J
 OpfNc5H2kbMr2xLfHjA8aM22Lt8BOXYKUf+pL2cSoDlZ1mKp1jxgZlsoBLqloQ5sdW0W07Rbb9o
 TBfqLLM7carEmZ9rubtaoMBsJZF7asE=
X-Proofpoint-ORIG-GUID: vx_5PdDUFVicoF9FI2_GbejgDgONcFGP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110218

On Sat, Sep 5, 2026 at 5:32=E2=80=AFPM Lucas Tanure <tanure@linux.com> wrot=
e:
>
> The previous series for the intermittent boot hangs on the VIM4
> marked sys_ampipe_nand as critical. But as Chuan Liu from Amlogic
> explained, sys_ampipe_nand clocks a pipeline stage that the
> hardware design inserts in the bus path between the SD/eMMC
> controllers and the NIC_MATRIX fabric to help timing closure.
>
> So the clock has real consumers: reference it from the three MMC
> controller nodes and drop CLK_IS_CRITICAL instead.
>
> The series crosses three trees; patch 4 (clk) must only land after
> patches 1-3, otherwise the DMA hangs fixed by 43e1705ecab9 come back.
>
> Changes since v1 [3]:
>  - Dropped the Fixes: tag; this series is an improvement and should not
>    be picked up by stable (Jerome Brunet)
>  - Moved the patch 4 dependency note below the --- so it is not kept
>    for posterity (Jerome Brunet)
>  - Dropped the e-mail address from the Assisted-by trailer, see
>    Documentation/process/coding-assistants.rst (Jerome Brunet)
>  - Fixed the space-indented error path added to meson_mmc_probe() in
>    patch 2, it did not pass checkpatch
>  - Dropped the CLK_PIPELINE() macro from patch 2; has_pipeline_clk is a
>    capability flag, not an SD_EMMC_CLOCK register field
>
> Thanks,
> Lucas
>
> Lucas Tanure (4):
>   dt-bindings: mmc: amlogic,meson-gx-mmc: document the T7 pipeline clock
>   mmc: meson-gx: enable the bus pipeline clock on T7
>   arm64: dts: amlogic: t7: add the pipeline clock to the MMC controllers
>   clk: meson: t7: don't mark sys_ampipe_nand as critical
>
>  .../bindings/mmc/amlogic,meson-gx-mmc.yaml    | 29 ++++++++++++++++++-
>  arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   | 15 ++++++----
>  drivers/clk/meson/t7-peripherals.c            | 10 +++----
>  drivers/mmc/host/meson-gx-mmc.c               | 20 +++++++++++++
>  4 files changed, 62 insertions(+), 12 deletions(-)
>
> --
> 2.55.0
>

Patch 1 and patch2 applied for next, thanks!

Kind regards
Uffe
