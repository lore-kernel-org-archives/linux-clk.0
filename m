Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9313A4520
	for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 13:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778505475; cv=none; b=Po4BbonBmA1GwFhIgK7p3mke90wa598xini/1FzlVJMWEoyiORCiI7owIb0prufySW+a5LRwi4WGrIz58nTT6al1f6m+yinoGZrEsf+R4r4lSILHTanBSsCuci9JfJMc4BUL0lYmbVA9FuchcX4DtkP+wgRN2zow1kPfRsfXpK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778505475; c=relaxed/simple;
	bh=70pRwaawB6fSxyFjY9MWQ2Wj667Hq0JjSk0kpFgv0o0=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=uHjt66xbD5aJFTwHIkPqJD323WD3jsn6ehdjh3B/GfH8A7r5d/QHlmmBTOuDsMKOhA45tyci68yoXRdEfLG5rSHDRwoI0hlYhMN4DcRL4R2u0UPqP8iHlo3NH+qluSJbtCGiu2iv68a3icuu6E5zx6TI39war72mcJNHSSjI8c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OKiZ5YAY; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OKiZ5YAY"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-44ccbd3290aso3409326f8f.2
        for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 06:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778505473; x=1779110273; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VpBr89JbDstdIUMvCB+UAEmSrotPv1wv1lCMdlQElUc=;
        b=OKiZ5YAYE5GosIW9lKyy4U4IQ6LOmSN909YdrCMzeucPYB/sKJ0yPm3hKVCQ9vW2nT
         G3lDMvs8v/iwvkUo4xCLNSvxsaP54sJRcysgPeBBl695/hAMiqidXxRNaT/rwRit4Amd
         RYgCS/ne+0R+xfxke34UlwcRq09huKA6yB2YXd+ftFPx1HBtvSOq/jEzogZTFXd1TWCd
         lY1SHqHJPv+q2pSEFRpUWePdeSvdBPO5hpLbE9qF4pPjcGae3WGqhW0ypO6JrCxHXcdT
         kiVNKNppC1oVavuE+0/xoLM1ZPqELlB33VkV+uWicfO6RlbfutFqaTgxJpNdDVO6W6Mf
         EHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778505473; x=1779110273;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VpBr89JbDstdIUMvCB+UAEmSrotPv1wv1lCMdlQElUc=;
        b=hnztQkBXV6En2y4qQOO9iCYqJkeB4hQ+SkNjgMyIrTscicUVjNfWr4Dl6QUVpR7Vmq
         /LqlW1UderVsrIOZqST/SyqG7w2DEpduUM1uf34JRQrG+hEQJDcksfQZUt26QVPbJV9T
         YdYQwywFB7Fp8da24gk5c0hmUvxNTcgO4n5B5yZPVT9/ngecwI0uI8SXYAoUi6iEOSQD
         WL0LGLw9WAv0AhUjKXDLfA2Fq//2HPIRzT5wpQKukEi5qCbs5aVJo/bw9sC0nOEoADM+
         QfEmCngik852B9qLUQlfxYzmJ4vfHADXxEt6YRygxQmE3XQaS0BxO3W59sbq+Rh0gMtB
         e62w==
X-Forwarded-Encrypted: i=1; AFNElJ8h3REQfaWnZxFqNKhHJsg+h+V5xhBjlPjsIJZxC7IkQXBOSjXEDDGNyb/qu/68WKJpO0g40n8+77M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9K3AKhT1fx2Hs3sllj3Elo0D7bMBPcITHaoU7vYtkt0o3eN1Y
	NCH4NZIZbEp7yV8BzgbyljFSKcG44ZbyD8zQZ4FFh+9+hy6wFXcz5MRt7nyKlhhP5zA=
X-Gm-Gg: Acq92OH0ULvYtlPHdF/DF38xc1NConU4ERmxts5bpn4M4yv3AoGv7CvcOY1/UJiXuL+
	yzBREVz5v2FPzXkWE5BXG765WoVhPLq3QMwtGJGOg8VIGLAFx258wolMu8XLelH9LGC/ZfDMEMv
	9/Jg7Bq6+xw7yNzRPdRbvsR/yq4cuLjTVh0aRnEPZ1Nkt0KYZ/D4B6TjvAuVtflq1PoKEDeyTGz
	AigLVSnOTSWII8Fqe0EQ11rVGo3yhakns5gPFudnA+4Wu2nsHNyD2NM94cr1AUPZHLDzU0oDsz7
	KsrpHvPlJDcsJuMpvB/lf+w4VYs48qpN/ETnk6tosvh+6kRD3s0FMtqON/UKBy40GNGjOrP+H0k
	3oxHy0SO4bCId0i4IrcrCm1PbSJtnTAeqC3dHAorjvLEJF2Jwy7tvdcr9K0wCSnGu1Gtie5eWBk
	SZB2NETAdb2tuKrSB+PRobgemGWeG+luYTVBLOL6WyCAiWvERULxbtImYVIfzy86c6ZxIRVFZI0
	ouTZKOC9ixgiYD/pQ==
X-Received: by 2002:a5d:5d0b:0:b0:43d:c2bc:21b4 with SMTP id ffacd0b85a97d-4515b525d65mr37422228f8f.16.1778505472478;
        Mon, 11 May 2026 06:17:52 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:5acc:6281:995e:547f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4549120f1f9sm25688565f8f.24.2026.05.11.06.17.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 06:17:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 11 May 2026 14:17:51 +0100
Message-Id: <DIFVKM72KZDI.14EVGUMQ0NV9S@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Lee Jones"
 <lee@kernel.org>, "Alim Akhtar" <alim.akhtar@samsung.com>, "Sylwester
 Nawrocki" <s.nawrocki@samsung.com>, "Chanwoo Choi" <cw00.choi@samsung.com>,
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 <linux-kernel@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <peter.griffin@linaro.org>, <jyescas@google.com>,
 <kernel-team@android.com>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 5/6] firmware: samsung: acpm: Add TMU protocol support
From: "Alexey Klimov" <alexey.klimov@linaro.org>
X-Mailer: aerc 0.20.0
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
 <20260506-acpm-tmu-helpers-v1-5-a9cd5daf8355@linaro.org>
 <DIBOWQYHOPOU.3PCLCL8030WRL@linaro.org>
 <806da86b-45b7-43cc-b364-97bade8f4041@linaro.org>
In-Reply-To: <806da86b-45b7-43cc-b364-97bade8f4041@linaro.org>

On Thu May 7, 2026 at 9:31 AM BST, Tudor Ambarus wrote:
> On 5/6/26 6:13 PM, Alexey Klimov wrote:
>> On Wed May 6, 2026 at 12:39 PM BST, Tudor Ambarus wrote:

[..]

>>> new file mode 100644
>>> index 000000000000..c68d60b4c0b3
>>> --- /dev/null
>>> +++ b/drivers/firmware/samsung/exynos-acpm-tmu.c
>>=20
>> [..]
>>=20
>>> +static int acpm_tmu_to_linux_err(s8 fw_err)
>>> +{
>>> +	/*
>>> +	 * ACPM_TMU_INIT uses BIT(0) and BIT(1) of msg.rx.ret to flag APM
>>> +	 * capabilities. Treat zero and all positive values as success.
>>=20
>> ACPM_TMU_INIT returns capabilities inside designated error field?
>
> yes

Heh. Okay.

>> What about other messages/commands? They just return error code there?
>
> all the other commands either return -1 for errors, regardless of the err=
or
> type, or 0 for success.
>>=20
>>> +	 */
>>> +	if (fw_err >=3D 0)
>>> +		return 0;
>>> +
>>> +	if (fw_err =3D=3D -1)
>>> +		return -EACCES;
>>> +
>>> +	return -EIO;
>>> +}
>>=20
>> Could we map these return values with better granularity instead of
>> returning -EIO for everything else that is not minus one?
>
> I think we're good as we are now. The firmware returns either -1 for erro=
rs,
> zero for success, or BIT(0) and BIT(1) for TMU_INIT to flag some capabili=
ties.
> I can't tell if there are other commands that return capabilities as well=
,
> or if there are other capabilities for TMU_INIT, I don't have access to t=
he
> firmware code.

On Exynos850 I see more than just one returned error codes. I definitely
see 0xfe and 0xfd at least. I don't have any data to confirm that ff
maps to -1 and fd-s, fe-s to -2,-3 though and what they mean. From my
experiments I suspect that 0xfe means that call/msg type is not
implemented or not accessible and 0xfd means that passed parameter is
wrong or incorrect or not found.

I am also not sure that I saw 0xff-s but, well, maybe that needs more
experimenting.

Thanks,
Alexey

