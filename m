Return-Path: <krzk@kernel.org>
MIME-Version: 1.0
In-Reply-To: <d80a8587-56eb-8b30-91b7-fba89f47a309@samsung.com>
References: <20170119091153.8439-1-valentinrothberg@gmail.com>
 <CAJKOXPd7UDhn0oxyFsYAtD4zKfOoZA0LP-CNdXmhCzjOs6Le=A@mail.gmail.com>
 <CAJKOXPdX2YhSf0T8zoZ_i=AxbNjWLy=jVF_zhj-b_kGX2x7zPA@mail.gmail.com>
 <3c181bf8-7861-5197-f423-03e36bc440c5@gmail.com> <CGME20170119093055epcas2p1c27509fae2ad6c32cc31186934fc9af0@epcas2p1.samsung.com>
 <CAJKOXPdGZtpwJpX4mZJfwGQkhwiBWWyCx5_KXgRUX0ap1R2ZJQ@mail.gmail.com> <d80a8587-56eb-8b30-91b7-fba89f47a309@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 19 Jan 2017 15:56:30 +0200
Message-ID: <CAJKOXPduZWRu6S8T1cZxSAOWF7DYJQWbW77SM90H92PKY-mFMA@mail.gmail.com>
Subject: Re: [PATCH] ARM: Exynos4415: remove dead build rule
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Valentin Rothberg <valentinrothberg@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>,
	Tomasz Figa <tomasz.figa@gmail.com>, mturquette@baylibre.com, sboyd@codeaurora.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Thu, Jan 19, 2017 at 11:44 AM, Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:
> On 01/19/2017 10:28 AM, Krzysztof Kozlowski wrote:
>> Is your tree included in linux-next? I see my patch here:
>> https://git.linuxtv.org/snawrocki/samsung.git/log/?h=for-v4.11/clk/next
>> so maybe something in linux-next is missing?
>
> No, it's not included. I will be sending a pull request to the clk
> maintainers this week so the patches should end up in linux-next soon.

... so how about including it? I do not see any reasons not to be part
of linux-next. You are picking patches for Samsung clk and pinctrl
(and media drivers? and maybe more?) so everything you pick should be
in next as fast as possible.

Best regards,
Krzysztof
