Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2DF3F164A
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 17:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774632498; cv=pass; b=rqDZ2bYAXoxqEBuzIk8ILJJeKuBbyJsu/eDQ/E01obaAY/otDgVpeC6SCttZme5MSWNZd1XSArIOINDEcSvc/PlxuopIEA91kLyyW+suAJHDtca3IdFi91ZeV0n9xGsI8zhWH+4JuZx1hjOhxrHPMdSeutnCaUO/p3KaR++N2+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774632498; c=relaxed/simple;
	bh=r07QpEoVNQj/cMLoIqWS+u26NN05SjTYmHOe7gn52aU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n99KHF2NOe2AX+VqgMfZtLsTzeHWWhK/EqEbo8z9Pu8RFrgivh3+neX3pPh/R3I1gY1PDHHHOzsager6BZY48RC+JuJl8dcHy4cWsYvMPexPuJIMeHAenSjR7vPNRzc+3BBiYtEkX0Vkr7GjEbcZ6Jni60Zlc+x6EustG08aiB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q2HvB1le; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q2HvB1le"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2bd5658b901so85890eec.3
        for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 10:28:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774632495; cv=none;
        d=google.com; s=arc-20240605;
        b=k9DhDycSjthBDzfg5C9XBxKtcE2Bb7iDgKOfzKML1lx62zZ0WbPbPlPi2Q4lrNp5bz
         E/HOSqQJOzepQjxasayWY453i0ROz1CANFKywAW3kI0wlb76onEIay6PUvXtv1oqWtHY
         X2NtAxhuznARc1QF7jfoSjAtnA67vc9XHIPN2CWICgu34bMzuYBBmpHIYICentsbQxRl
         /KYAkN3Uge7xp7gVGJVPMFRIWISaegDRuZXXYkkC+9ViLoAYtOltpih+jTLhcyf9/8Mz
         v6aToYxQt0ijTDS/FHAalv33BSEj7+GtYIbpYTMQpXfGXdeN+Fu5g/VOtev5rWJuE9pl
         +flg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fl/30Pozrrpem/yafXqH62BWdDU+A3/vTaR/fO+0gHw=;
        fh=03Ea7wShEs4b3QTXO4rDqrgFRDophgdi+2p6w3AuF50=;
        b=MDhPh0pEyaDNLzEJxvFdjufdZxqWfqvXhNc3Z30e77FrNW5CDQRJcjCauhoFASz6Pu
         L6k3HSbhJU5Hn1LGcMI5fxVh8zlpC+xAjtRXUlgqku6hzG1/uxWed8LJimVT1bQm3eQ+
         OYDrO4ZFupcrJl+RlPwne4/n1z4zbbqDQPl20OaTylWXXMi5Sc7H2OHINLN5NV9fFB1s
         ncvXqdge+eZSOVfcBs5JbpTy2n66nr8b9iCcJC4tyMMr6VS8BQlyEQrQrkeu3KW4Tl7k
         2veOLrNeLg4jD/WZruRGHnPxQRvWvywEkI5NAhwCzSgvzyzlGoDBHnk8PRg18HVhEDt0
         iVrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774632495; x=1775237295; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fl/30Pozrrpem/yafXqH62BWdDU+A3/vTaR/fO+0gHw=;
        b=Q2HvB1lepZeyiEaMLs07wlt04OT8CsRPS6rD880plQuOUNt9ayBKj49ExUeXepWwsk
         hvgdVrpAog+Ve6cMLilo782z+3TBuiCYildMY3dsfmJhY715eDP/mBZuS7uHWD3Dz/ZU
         Y471B8ne05E/vVBPBGBn4DgaQSdJJSR2FDqx8sNucX2/cC8RDk7+UhulCpPriJ4cytxt
         74BIsv5Vq7gn0JugSL5ZmSNHm3J/huRtALxNUyGCk+oPoLBE6C9Q73xJomWXfhZOcapp
         PzRoXRoDIzuWBD3tDghLeJWTiExyXCswxd8fMuQo56yJvDx4qyCMRUjGMzvoZPHvXmwJ
         T5yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774632495; x=1775237295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fl/30Pozrrpem/yafXqH62BWdDU+A3/vTaR/fO+0gHw=;
        b=Fq7ANOHOyuK0d1rRiP6XWDpcXDqBUn+XzoNPtywmoxyFP3Oe0Cgr/g6CiwvS8bfKJv
         0ix8AIOwZRzQFNoujdtOPczy1FbZMhbkZzcTWTXh88Np9YLDi4P2UU1zuqZ/4UuZQ2i9
         aZm2oljcxUdFp5vgkdd9UPfmFs1ZEGCvnq/kHZh76RrCKOIF9AzmZjT9U/1P6QL+ht9L
         F9KfMocr98XhtnhTbbnz4iRhKvhOGofgMNwCNayrsB9p/jyWipvXYfQYo9iDaAZNPgZ2
         2W4o6DkzAeuH9hX1fHQ9GT77BtxGwG48dL3INhvtePt5tMxNRVQ4BAwtFY3dSgZUn2/4
         kvPA==
X-Forwarded-Encrypted: i=1; AJvYcCVtOh1a1jWqgfn9/znLGyWK7XsGzI2s9MhEEp9+TsSaEzdTzuPM4/TBeb0xov2nlqtveZ1MozRb0fM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9iyb68R3wkDeUlyCOfIvvHxD4lRyR+iu51HkGOnzPX4TwoLDV
	GdM2fIclAt1AGULG/aEtucT/I/mK53JeDdAPVOWK8AhesP+A+1CZe94+dTGP8eWeMTRfyVG9lXp
	Q03UYm7aa5KWn35qcNfrzkkmS/E1aL3Y=
X-Gm-Gg: ATEYQzwx3XlSu5j2JZFZ20LEP1AUocalFn6tEXWHDDxqtphhpq8FRrsi/deukh09Hut
	4DUhIJtEzbe8uo0C+gsnWLF3uA35VYmPS7BDIR2jF3ODWMdC6QGm36FISBcYkzuUq8verUiGA/U
	61ICzCzYDU4HJrE+k3/oIcIXyqRgYlt8ZXxvUM24BJaYB3yUjh3UJ5ao2RZ+qyqpYzLhxr0YAUy
	NcN/F7WacOMgA6SV5sxl9yokkt9aMshfCu7x/Ha/jc91l+Lr9FDLmPOcg1GMIpx0tlvtfF9lmEW
	hOu7AOxn1+Cg/fT4OAOdQwVjPPKLPDMrJQVl2VqnLvxpbE/CKivCTwHCy1GJUpW9Of7FBMNjOfX
	/YkdPU9p8DmGrtJb47/mdfjyYM6Ymh2nn6g==
X-Received: by 2002:a05:7300:2309:b0:2be:681:91b2 with SMTP id
 5a478bee46e88-2c185f4e132mr930663eec.6.1774632494589; Fri, 27 Mar 2026
 10:28:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-clk-send-sync-v5-0-181bf2f35652@google.com>
 <DH7L09UFWGTK.2MT0OTWH1DUV4@kernel.org> <20260321-awesome-hot-kingfisher-5d9f55@houat>
 <CABx5tqJvOFEzmadeXpDxSUjkghviqtP0jo+kzSB5X6u_P_j2ig@mail.gmail.com>
 <CABx5tqL+G9i1ZW7i5AHaTqUFTVRDmBvP=RycUdwjG-GOp4uzBA@mail.gmail.com>
 <CANiq72=M3H-06L7udG_LqTwLykZkAjfy2d5NXQZn5TYRJ+N37w@mail.gmail.com> <CABx5tq+TdGvL+SCUe87qWFgeAq-1Zf5w63jn2hLe9+YTyz4sNw@mail.gmail.com>
In-Reply-To: <CABx5tq+TdGvL+SCUe87qWFgeAq-1Zf5w63jn2hLe9+YTyz4sNw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 27 Mar 2026 18:28:02 +0100
X-Gm-Features: AQROBzB_RVTF4XlQkJ9XF8lid9aR8wXF5WiHOT3rgHJbDAOKcJRtKWbfa3x37CM
Message-ID: <CANiq72ktmUFsdpBUKnU-OvTj7rE5iZKFucubL_1bF1Ws_KYXcg@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Implement Send and Sync for clk
To: Brian Masney <bmasney@redhat.com>
Cc: Maxime Ripard <mripard@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Michael Turquette <mturquette@baylibre.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Drew Fustini <fustini@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-pwm@vger.kernel.org, Boqun Feng <boqun@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 4:17=E2=80=AFPM Brian Masney <bmasney@redhat.com> w=
rote:
>
> I am not a clk maintainer, so I can't leave an Acked-by for you to
> pick this up unfortunately. I've been quite active in the clk
> subsystem though the last 6 months or so.

In that case, I could take your Acked-by as an active contributor of
clk if you are willing to provide it, i.e. with the "# Suffix"
notation I introduced a year ago:

  https://docs.kernel.org/process/submitting-patches.html#when-to-use-acked=
-by-cc-and-co-developed-by

  cd9123eeb224 ("docs: submitting-patches: clarify Acked-by and
introduce "# Suffix"")

i.e. Acked-bys can nowadays be provided by other stakeholders apart
from maintainers, e.g. people with domain knowledge, userspace
reviewers of uAPI patches, key users and so on.

Especially so since you offered to be a co-maintainer long term, so I
think having your Acked-by is way better that having no tag at all :)

Cheers,
Miguel
