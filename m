Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD6334A77F
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 16:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769530596; cv=pass; b=cRjXzr7uOAW1ZcEQos4zEztKBcqJ6gMKWxyAUGNyBqYBiai0H2YmTpfAXUrqRcfI0s6fiGebtqfbcM3OcvFcBRbmuoNpqI4+HJFdOKVZi8KqQAluV9QcIBUvs2KckLFhnXACe0LEWrD2Pd8UrlwQYhDHlO+93zf7XiW67Du7ItY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769530596; c=relaxed/simple;
	bh=aLECeGHvb/kzZnkA2H6Ej9ucGaNpds/MHozGNmB8154=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XjnJrGdhzUJdDLeIJnEGX9G3KiNkq5bs1lcmWiEpKAWnXmFecl+aulsz0ZVBCKJ+k8SIWJQnAqNrRki/5IngQY5rrXwghlRDqZ2JVV/GnMvz5cNyrN9jCoyIPAlOah0uJCLcLhxxZO68wEofTSloEH1WqqAPyi5WFZAAwkL6Ls8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K2v7QqXA; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K2v7QqXA"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-385bdc72422so48720271fa.1
        for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 08:16:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769530593; cv=none;
        d=google.com; s=arc-20240605;
        b=YxyjqMJ7tHurUmkQ3biAOcqmMYdhrM7JbdMW0hXxlGzRQLh+QFQY7Y0B2i1tXP6Q9J
         PYIvWTuOq8I4oQnZJcj5otaCiwDDevgBUuDktRzOG+vkf4Ccl4cEQpjF9OYaOHZFr312
         FUDws8dZvI0Sncxf+kUFz0Q5B8CcPtOqMmfsahpoCk0TfkGKrlUwlIoBG8qVY6N30FMp
         60THpKQakmjI06G3YKb0uZkd1Lf7DjvQCcfc9N2+OZD5f71ax26BxexPtpSikLwreKV6
         GsODa6+jN8+vX4U73a64MCtlXsnyJJC1OWHPM+d+cgX7en4oC6RuhtSDpAzvaWNO6XlS
         kufg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aLECeGHvb/kzZnkA2H6Ej9ucGaNpds/MHozGNmB8154=;
        fh=J6Cl4Lw1uDxEpOUSL8JTYh9LfOSHbHd0Vdsv4nJrTg0=;
        b=XotJA/E8ZoECCt5Y9Cd5xBxs3PlK1P5WEGVSj4eS1g/u6m+BRU1N6els6tqSrn0ZZX
         9OjyFVe0Xv8PncIxwz+Ce3llpogkr0r5coMHCMmKq89wumG7Go24Th2q/qkEGx5GsCR6
         lKzgfegp1AQJ+2HxmneVVCPT8wHqODrcAtdom+/EingdtfP/mWKGHMqoHGAyU5/Egc/L
         HviTvZxelUeCzuxDdBb6OP3bq4CTVMrE5SEc0dnXq4uiTnkh6AGEdssPGNLVaR0b6WJ+
         781D2NigTnZ7icxDTKdXZypjXCvSdX67ar5gi6H6FHTdM/fU9Mu3msnaXv4vhYQaSBQm
         dtvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769530593; x=1770135393; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aLECeGHvb/kzZnkA2H6Ej9ucGaNpds/MHozGNmB8154=;
        b=K2v7QqXAB+oZsRnfDsJP0eI4E5ny6xbdW4SPQNM5dLYILJllHXVqFNHTf4ibWUZiLk
         AQzCtXXo4p43ktK32IGk6Nl48oh73ltu1JqdeR0cE07qiGxhf/RU2DuceiBydKZtMvhf
         Yy0YDkvTOYGW8TM+58DtZk71f/VKAJCOBgz2MRrDn7cKMs8TUCpU4DTieZX5GwZxlZS9
         GYjdW8u27igT2Cmr6mRyOeLW9sEgS/OtG4Lo2IBX46XIQMpcR8QhyJht+n1RbAMX8blz
         xw8wOQtfz1jMFD96LRFcAInrkivK6B4HxFWxvMBVAZjAHpdWLCsu5D8dKDV0YLMlF2Mw
         GcAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769530593; x=1770135393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aLECeGHvb/kzZnkA2H6Ej9ucGaNpds/MHozGNmB8154=;
        b=r0Rm7WVVGd2y7qiv6JS8IqWzfh0hC1nJ7rfZ4yHcsBJ+PqsSwPZo602FROUKddZM2N
         AGiPscXQQXlPH8jc7OEbxIXKewCeNHdXsKEYLJzw+alOBHek4um07h+h9HQgKst+p9O1
         qTaSieyqi9iaC7u4OmO3Yc+As60OCfcdF9eZ9c3NAfIuD4DSN6EStcz7ob/EWY6vXJpx
         Ra50JVd9A0yH65Qv0d4dQns+tMwXyuHRzZn6W216k4USP1NKWX7Yno4lR2rVGPKWrvg5
         6hlpboMqUmUyhqjzwQTYn0Sz1u6/t6c5m57ucFeuPXVXi2WEYAvfPvkyq85FRNgiWrpY
         TZVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkv23UQBneckTLcNMRDs36ayXEMlldWdTgrfta/Koxg0ve8+ahb9ROrCOhnPWJZtH4rE/HCIScCqY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh1XFYKxhAN9kGgHnvhhyW735C1wM9LcCp2wY5I6Ka3GEqBtcD
	NjI+Do35n6Mr9ppBJjaLxdDx40SrerbSBl413l+NdKJdroaXo2f4XZh4b6ESB5CglKCa5akPDhs
	bPIxwd/5QC/k0Xvot073BDFhL/V73Fnc=
X-Gm-Gg: AZuq6aJJeoMfMWZS8TPYX32QOKJ9SKjUieDzsRi4DL7Zh3YnUCG72LaQXA9BvWaen2E
	Smw5d+cVnznOG+qdkqmfiIkTs0gXzz9lsLTzN+n4CO+sOohQ+s5EXPLPs0TMYysLlaWi7hEwF0W
	5PmdG9cC4nbJ52rsNDhnN29P0PO18eYvyFAiveWg5/Rz/x1oAWAlpjLFlK3dIMEomqs7lWW1Fvl
	QMT4e4XZ468aPkOR/hdJ4WfEmRJB2WlUra3ehV0i8TPyt8P6Zm16jlcb5C141/QMPdxlWbF5Ood
	EdHucuWPzY599PPTOrBPX+rAaD7+63bPyDNZ1KAYtfxgNlrTm0PzVSqsfCv50aOlKIT/gxC/49u
	3VA54/g==
X-Received: by 2002:a2e:be9d:0:b0:37b:a664:acde with SMTP id
 38308e7fff4ca-3861c9e6cf2mr12292251fa.32.1769530592979; Tue, 27 Jan 2026
 08:16:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-cstr-clk-v1-1-ef0687717aa1@gmail.com>
 <CAJ-ks9mjBY7x1s_4wqMC8xqWsX2+aCM6NHn0j7yh_+daKiyS1Q@mail.gmail.com>
 <CAJ-ks9kn=0Sm2_1WV4xyzunzcGG1VZDKy8L=_SCCWyV2OkJTDA@mail.gmail.com>
 <CANiq72krt9De1+WgMh0y8XX5K9RrU-_1FuSp+sKO1Ya8EaVoUg@mail.gmail.com>
 <CAJ-ks9m-0C=hOdYC_z9mNH54fXjnaWpYgZSPaWoJC8rnQ4Kgkw@mail.gmail.com> <CANiq72m0TCPTEn=HkMg19Et7JFeRc-fqP+MxP1gaDosSF42iww@mail.gmail.com>
In-Reply-To: <CANiq72m0TCPTEn=HkMg19Et7JFeRc-fqP+MxP1gaDosSF42iww@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 27 Jan 2026 11:15:56 -0500
X-Gm-Features: AZwV_QjkJfUNNVNZl-mxPXC6CrfK9BzaT2kQwlk_AQVc_ZUxCIBEA3TeQf56sIk
Message-ID: <CAJ-ks9nimp4WEOOQcMEK1JULgqrM1hugO5s=PxsP54n-nShCWQ@mail.gmail.com>
Subject: Re: [PATCH] rust: clk: replace `kernel::c_str!` with C-Strings
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 9:27=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Jan 27, 2026 at 3:14=E2=80=AFPM Tamir Duberstein <tamird@gmail.co=
m> wrote:
> >
> > Another ping here, folks! Miguel, what can we do if we do not hear
> > from the clk maintainers?
>
> Stephen already Acked-by this one, right?
>
> So I assume they were OK with me taking it -- I will do that unless
> someone shouts.

Great, thanks!
