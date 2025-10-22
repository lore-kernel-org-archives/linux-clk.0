Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7C126AAAB;
	Wed, 22 Oct 2025 09:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761124572; cv=none; b=SSXDw6kPL5a1vcHzLD3H96/LNMfW/LK199uU6Te9mFQq/NMWts5GUx0YyzYlRJ0qk1E2PO9Il6u+GtuxhdBhKJ3bgeD+fOYFzrcRMMDXmiXFdRgU6zSUQLYc/zDyb7tt9Ob/jd/U6OtbMyclCeQIb6rStiJGathuPv58BiHYxDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761124572; c=relaxed/simple;
	bh=mUqsZ/NHm2T4ZQHnrqEsg1PX9duhULKKJOquWhDfUlE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qh5vLe4rMuBFJJleMlur+i0T/Zuy+B2g7NeKn2soqPI2Jb5WX0BnXBJZ3ZaxlqGhHC1pwIBtc2sMsr+dPeAy73d9IwUvhQD3VqXzITutn6Mkab6mcZ0oKn02X4swjuqrA8pCqD8/Tn92TXVaUNLbz505ZGEU8V+d5SPAD2Fd7aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FF34KdIF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FF34KdIF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3491C4CEE7;
	Wed, 22 Oct 2025 09:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761124570;
	bh=mUqsZ/NHm2T4ZQHnrqEsg1PX9duhULKKJOquWhDfUlE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FF34KdIFNWDaQD7gbwO9qq4HgrK+KDXsNDhRqLYidL8qQGs/UDPI6dtWztAfs8lgH
	 DgxkkrQlt4KmBDGStixwr2L6yKVNtcQtcLKeesy5HH30Pm/PamY5c5jBuDGhRUM2Hj
	 YhoNAwbthNuNGD/Uo9z6/qmia2tTc+FyZ2pw7oetpzeCh6kg22uSfEvDJa+5D/adDf
	 deWFk+ZzemvPilGIhembB3P7B2TYmDblDv0AnrFJcmJGVobh/2SB5TgNBjUyC1UimO
	 foXMFSsmNKmP1Y8ppAP5hipMu3mFP4Dnk+u99CzJVmdZ4PYCw/8/+UpOJEN8kQ4FLX
	 O4Tfo39qpknTQ==
Message-ID: <8e1ca6ac-fd35-464f-9b8e-19bdb2e7410a@kernel.org>
Date: Wed, 22 Oct 2025 11:16:06 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] rust: clk: implement Send and Sync
To: Alice Ryhl <aliceryhl@google.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Daniel Almeida <daniel.almeida@collabora.com>, linux-clk@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251020-clk-send-sync-v2-0-44ab533ae084@google.com>
 <20251020-clk-send-sync-v2-1-44ab533ae084@google.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20251020-clk-send-sync-v2-1-44ab533ae084@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/20/25 11:35 AM, Alice Ryhl wrote:
> These traits are required for drivers to embed the Clk type in their own
> data structures because driver data structures are usually required to
> be Send. Since the Clk type is thread-safe, implement the relevant
> traits.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Danilo Krummrich <dakr@kernel.org>

