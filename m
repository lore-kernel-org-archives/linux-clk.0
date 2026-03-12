Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCBC3A6F13
	for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 06:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773297682; cv=pass; b=HJ0/Ib5aaIDfLyv6/b5EfIKdjgGP3sI5zhzHYyOqTcg4UkJ5H/Ipge47kmTmM/8a0gMyEpubEjYlzk/P0pCwIRBRi+RzhK64nAR/kjcxxlyqg3+2sdAHaiEE04WIAy7GyT2dUi7DstwivVK/MZ6Pr2ZbWobdqO/MWog4aIxZ1Ps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773297682; c=relaxed/simple;
	bh=ruqRuW5SL/WOPbRDc7f8nNsrXjE37PMZPlSi9lQGPBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GkUDeXdi6MqFKVJjYr62ceua7kJVQP7LnKRYL0QJcmBaBydoHZbSoyvFHBRZRCWPw/z1NcupUQV0+4LsM6N8QZstkbCl/2sA9SFCIJxNQS6J33rF0/cedFWKYkPPpg9kafXlmaf4cquRhJwfSnIso22XVjRAxKve0rhOl7sM1fw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eapm8q3E; arc=pass smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eapm8q3E"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-94e82e5b262so159268241.0
        for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 23:41:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773297678; cv=none;
        d=google.com; s=arc-20240605;
        b=ee9SZIClkBJKbkKnAqVacX8iu2dRuUyi2y/wqaWPc5qPMVZj/OHBD0jgP9ZoFFE0lD
         0I7xVJkVclwC4NGHxOGyjcacHTJim7KsmPQmtpEzmskF8Rcnj90QRAQPJuRYvUWl7ry1
         I8c3Hk1RGdaN9Pcr3Iylwxu/KBzDpMe0gidUOxT8bh8r51PRl59Ednvj4oETXUQkbSai
         GguVENK1Xf/OMYBWxOr/Z+UL9JaBtrZgZgvaxIZndTOfPGhiM074JkfbiLE96Au3BdQA
         ml9A/gETuA+7meSS1vwmFoHk1yyTMSV5/+1OPe0YABQpbXUBi1jGUVlAzYFtDHok8/98
         kxxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ruqRuW5SL/WOPbRDc7f8nNsrXjE37PMZPlSi9lQGPBA=;
        fh=Zruqwjfj8JIkCEzbqJ0V73sY69Ef1IxmaVzP4U74cUo=;
        b=Gbb16LM47rhXRyIbss+oA6Qpya2bSgO34MwQS0miEW4LPRhGOzceMTMQGBMUDyBnrb
         FiwoXzI6i2e25q5J+49RSjvoOB886VbSgre1ILc33xlp0XTfpLVvXYm+HMXnTe6tKX9R
         DftQehiJtdjOQBR+Q4Y7B7ihWJYwRQorMMeMmpj3VWX15Wh8GVjjFpEnmttDXuyph3QQ
         NqU2+ATJiS7OOTlJwiRKWxScwj/N19osEFJwp7yMT+FxPffbl08zjIjoncbnuDnpKVmD
         P/wLtXK0MSRWJsqxRVzfGDetMC3JzXgB+qMfkpPjexvd5e4fTfwFVp0LewQvt0knU5p0
         nPZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773297678; x=1773902478; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ruqRuW5SL/WOPbRDc7f8nNsrXjE37PMZPlSi9lQGPBA=;
        b=eapm8q3EK1SFDMUx6sCVYTTiHPWhq1cZUUR9TVZ2sglxTNXndvaz3TIWtFczNCaJSz
         yWkAcPSypiKssA/7J7C2wk9ep1D4D4IFKl0qasLHySpk4hFor0X9o/FLC92NmbvyZKB3
         HrGu3kO/meF3+hF7n7hjWnyaUFkIEjEz3S3PuOviCMvAavVatmuqK008wzWo6q/P9tfP
         xGPa6eNn6UNKizJAAxW+KxqYxrAZygXvPJRUjx0RrHHOPH2VeoL85TE0dBeX+N7+NyE2
         9lrIOEAAERQaDHgJWnL9C1E/xNN7hKFsdwkwWnH7aIzAirZdJFH0Hzpu0h12qsaceTOg
         nq+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773297678; x=1773902478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ruqRuW5SL/WOPbRDc7f8nNsrXjE37PMZPlSi9lQGPBA=;
        b=TB2Sj4nM623rG6twYRWo5SPy9IjCXn3IMKuREXq5BJzIwklfMv9LI3iaWdviAGE/6Z
         avO7btJv0qFM6Lmhies9ELpwmB+5W+kUeHDGVevJ/sKjiWeof6O1s5zW9+5GeVaZz9LS
         P5BKNmecYy1/alkN1la2r4OwGP1oHrikLdfT1H9S72mFQhTy52BYDhP42OnAuswJ0EK1
         xNVZS/tBks3ItleEVf6E7JzAlicsLIa5nmm42NalKjRzcaUCJHNpztDXOpklQcLGQ8El
         girDI2WZO/uhHfjYojaT09Z6gLekOY7DM/UVyf0hJZPSri7VJlrmgBqZbzjK9uVyqzyD
         uUhA==
X-Forwarded-Encrypted: i=1; AJvYcCWPhWKOIJpIhrtbzZSt7Jv3lEKGLN+QlQ5iDnA2A5lyn6jWUGh1p1Srd8xNE5X94ZJ5doP5hq6duDs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuDStChUkDWiMcm5BNgg9TLWt5vsPGLQBR7eWszszUBrl48KdU
	ZqtOnfL8PGbppPFIUaPV1Q+M2w1wrX8pZRoUws8Rfl8ZZ0FhRQmhHhN43jiQ2S4HeiBpbG769qu
	8MH8jLz+A05WCpC3YA8MIO2vugJItwk0=
X-Gm-Gg: ATEYQzye4ed+mrOQY64ajQHOLqxRB1UiS+JDuL3Id3bw8RFTnJVhDsUVp3mJK58bsFH
	Y7UCaNaDUuZOZe8ibWvAtWivtLcwv7OGuUgQP4ydhB6K6od4qCiBrrnDlqh1MUSrzDDNrzq5KiI
	TwfJy7E20HjaWOKvbXuyQXz5iJS6GwX56Ye1RgO9gepDoQNI0hke/eR7n0kacM23iaoazQoNpnH
	LVPbYfix2gG2sAPKB3RWRge7XVXuyNVkfDb7EgvluCqVs7h468CbNBi0Ygv0q2H63bG5R6MW+Zo
	YHn+r07D
X-Received: by 2002:a05:6102:c0b:b0:5ff:dd9f:3ea1 with SMTP id
 ada2fe7eead31-601df08a60amr1728016137.39.1773297678151; Wed, 11 Mar 2026
 23:41:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAH2e8h4R-nF+eV+OnkSySKSY5_H-V8Ndyfhac3=VNQ-bMaBeFg@mail.gmail.com>
 <af606d6c-3ce3-4342-bd5c-ce3ea28c6923@oss.qualcomm.com>
In-Reply-To: <af606d6c-3ce3-4342-bd5c-ce3ea28c6923@oss.qualcomm.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Thu, 12 Mar 2026 14:40:54 +0800
X-Gm-Features: AaiRm52ANSGIe5raH-Y5MaxjaPKZX8myZRmP4R9pHNsa95fTfc0HNUXVKy8RQA0
Message-ID: <CAH2e8h4Vp9fJYAUUbOmoHSKB25wakPBvmpwa62BTRqgRQbMWuw@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: sm8750: Add GPU clock & IOMMU nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: taniya.das@oss.qualcomm.com, abel.vesa@oss.qualcomm.com, 
	ajit.pandey@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	imran.shaik@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com, 
	Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 9:32=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 3/9/26 11:27 AM, Pengyu Luo wrote:
> > On Thu, Mar 5, 2026 6:40 PM Taniya Das <taniya.das@oss.qualcomm.com> wr=
ote:
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> Add the GPU_CC and GX_CC (brand new! as far as we're concerned, this
> >> is simply a separate block housing the GX GDSC) nodes, required to
> >> power up the graphics-related hardware.
> >>
> >> Make use of it by enabling the associated IOMMU as well. The GPU itsel=
f
> >> needs some more work and will be enabled later.
> >>
> >> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> >> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> >> ---
> >>
> >
> > Hi Taniya and Konrad, GX GDSC stuck at 'on' on my device
> > the raw register values are
> >
> > 0x3d68024: 0x00000000
> > 0x3d68028: 0x00000000
>
> These likely indicate that some clock or voltage rail is not accessible
> at the very moment you're reading them back
>

It seems to be harmless. In the downstream, they are always zero too.
TB322FC:/ # devmem 0x3d68024
0x00000000
TB322FC:/ # devmem 0x3d68028
0x00000000

In [1], the commit log mentioned
The GX GDSC is modelled to aid the GMU in powering down the GPU in the
event that the GPU crashes.

> GPU support for 8750 is not yet upstream (and A830 is somewhat different
> vs the supported A840) - there may be something wrong in that sequence.
>

Indeed. Chances are that I can't enable gpu. I must reboot again and again =
to
match the sequence by luck, then I can enable it[2], and I must
disable register protection.(I just noticed the hack from here[3])

> I heard it's in the works though, so you may be better off waiting a bit.
>

Glad to hear that. I am looking forward to it.

Slightly off-topic, do you know if anyone is working on wcn786x/wcn7880,
sm8750 QRD SKU2 V8 Power Grid uses this.

[1]: https://lkml.org/lkml/2024/1/23/1408
[2]: https://postimg.cc/xJr11DK5
[3]: https://github.com/gio3k/linux/commit/f96512ab05a1bcc6b7e82b27f44d9072=
38fc64fb

Best wishes,
Pengyu
